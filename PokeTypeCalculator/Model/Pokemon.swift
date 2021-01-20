//
//  Pokemon.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/22/20.
//

import Foundation

struct Pokemon: Codable, Identifiable {
    var id = UUID()
    let abilities: [Ability]
    let baseExperience: Int?
    let forms: [Form]
    let name: String
    let height: Int?
    let sprites: SpriteImages
    let stats: [Stat]
    let types: [PokemonTypeHolder]
    let weight: Int?

    var displayTypes: [Type] {
        self.types.sorted {
            $0.slot < $1.slot
        }.compactMap {
            Type(rawValue: $0.type.name)
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case abilities          = "abilities"
        case baseExperience     = "base_experience"
        case forms              = "forms"
        case height             = "height"
        case name               = "name"
        case sprites            = "sprites"
        case stats              = "stats"
        case types              = "types"
        case weight             = "weight"
    }
}

extension Pokemon {
    
    var hasMaleAndFemaleSprites: Bool {
        return self.sprites.frontDefault != nil && self.sprites.frontFemale != nil
    }
    
    var hasAbilities: Bool {
        return self.abilities.count > 0
    }
    
    var hasStats: Bool {
        return self.stats.count > 0
    }
    
    var hasForms: Bool {
        return self.forms.count > 1
    }
}
