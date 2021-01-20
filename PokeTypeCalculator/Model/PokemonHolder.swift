//
//  PokemonHolder.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/22/20.
//

import SwiftUI
import Combine
class PokemonHolder: ObservableObject {
    
    @ObservedObject var primaryType: TypeHolder = TypeHolder()
    @ObservedObject var secondaryType: TypeHolder = TypeHolder()
    
    var cancellationToken: AnyCancellable?
    
    var name: String? {
        didSet {
            if let name = name {
                // TODO make this cleaner
                self.pokemon = nil
                self.primaryType.type = nil
                self.secondaryType.type = nil
                self.getPokemon(name)
            }
        }
    }
    
    @Published var pokemon: Pokemon? {
        didSet {
            if let pokemon = pokemon {
                let primary = pokemon.displayTypes.count >= 1 ? pokemon.displayTypes.first : nil
                let secondary = pokemon.displayTypes.count >= 2 ? pokemon.displayTypes.last : nil
                
                self.primaryType.type = primary
                self.secondaryType.type = secondary
            }
        }
    }
    
    func getPokemon(_ name: String) {
        cancellationToken = PokemonAPI.getPokemon(name)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    self.pokemon = $0
                  })
    }
    
    func getRandomPokemon() {
        cancellationToken = PokemonAPI.getList()
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    if $0.results.count > 0 {
                        let randomInt = Int.random(in: 0..<$0.results.count - 1)
                        self.getPokemon($0.results[randomInt].name)
                    }
                  })
    }
    
}

extension PokemonHolder {
    static func mock() -> PokemonHolder {
        
        let pokemon = Pokemon(id: 1, abilities: [Ability.mock()], baseExperience: 200, forms: [Form.mock()], name: "Litleo", height: 10, sprites: SpriteImages.mock(), stats: [Stat.mock()], types: [PokemonTypeHolder.mock()], weight: 30)
        
        let pokemonHolder = PokemonHolder()
        pokemonHolder.pokemon = pokemon
        
        return pokemonHolder
    }
}
