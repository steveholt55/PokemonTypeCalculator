//
//  CalculatorViewModel.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 5/18/21.
//

import SwiftUI
import Combine

class CalculatorViewModel: ObservableObject {
    
    @ObservedObject var primaryType: TypeHolder = TypeHolder()
    @ObservedObject var secondaryType: TypeHolder = TypeHolder()
    
    let showSearchViewSubject = PassthroughSubject<Void, Never>()
    let showDetailsSubject = PassthroughSubject<Void, Never>()
    
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
    
    @Published var officialArtImage: URL? = nil
    
    @Published var pokemon: Pokemon? {
        didSet {
            if let pokemon = pokemon {
                let primary = pokemon.displayTypes.count >= 1 ? pokemon.displayTypes.first : nil
                let secondary = pokemon.displayTypes.count >= 2 ? pokemon.displayTypes.last : nil
                
                self.primaryType.type = primary
                self.secondaryType.type = secondary
                self.officialArtImage = pokemon.sprites.officialArtImageURL
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
