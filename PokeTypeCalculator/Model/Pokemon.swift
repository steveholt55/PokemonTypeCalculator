//
//  Pokemon.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/22/20.
//

import Foundation

struct Pokemon: Codable, Identifiable {
    let id: Int
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
    
    var bioInfo: [BioItem] {
        var info: [BioItem] = []
        info.append(BioItem(name: .number, value: "\(id)"))
        
        if let height = self.height {
            info.append(BioItem(name: .height, value: "\(height)"))
        }
        
        if let weight = self.weight {
            info.append(BioItem(name: .weight, value: "\(weight)"))
        }
        
        if let baseExperience = self.baseExperience {
            info.append(BioItem(name: .baseExperience, value: "\(baseExperience)"))
        }
        
        return info
    }
    
    enum CodingKeys: String, CodingKey {
        case id                 = "id"
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
