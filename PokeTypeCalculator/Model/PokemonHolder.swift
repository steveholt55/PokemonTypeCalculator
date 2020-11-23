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
    
    @Published var name: String? {
        didSet {
            if let name = name {
                self.getPokemon(name)
            }
        }
    }
    
    @Published var pokemon: Pokemon? {
        didSet {
            if let pokemon = pokemon {
                if pokemon.displayTypes.count == 2 {
                    self.primaryType.type = pokemon.displayTypes.first
                    self.secondaryType.type = pokemon.displayTypes.last
                } else {
                    self.primaryType.type = pokemon.displayTypes.first
                }
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
    
}

