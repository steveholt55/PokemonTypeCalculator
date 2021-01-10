//
//  Pokemon.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/22/20.
//

import Foundation

struct Pokemon: Codable, Identifiable {
    var id = UUID()
    let name: String
    let sprites: SpriteImages
    let types: [PokemonTypeHolder]

    var displayTypes: [Type] {
        self.types.sorted {
            $0.slot < $1.slot
        }.compactMap {
            Type(rawValue: $0.type.name)
        }
    }
    
    var hasMaleAndFemaleSprites: Bool {
        return self.sprites.frontDefault != nil && self.sprites.frontFemale != nil
    }
    
    enum CodingKeys: String, CodingKey {
        case types      = "types"
        case name       = "name"
        case sprites    = "sprites"
    }
}
