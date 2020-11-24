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
        
        let pokemon = Pokemon(name: "Litleo", sprites: SpriteImages(backDefault: nil, backFemale: nil, backShiny: nil, backShinyFemale: nil, frontDefault: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/667.png"), frontFemale: nil, frontShiny: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/667.png"), frontShinyFemale: nil), types: [PokemonTypeHolder(slot: 1, type: PokemonType(name: "fire"))])
        
        let pokemonHolder = PokemonHolder()
        pokemonHolder.pokemon = pokemon
        
        return pokemonHolder
    }
}
