//
//  Ability.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/17/21.
//

import Foundation

struct Ability: Codable, Identifiable {
    
    // Identifiable
    var id: String { name }
    
    // Internal Ability
    private let ability: AbilityInternal
    var name: String { ability.name }
    var url: URL { ability.url }
    
    let isHidden: Bool
    let slot: Int
    
    enum CodingKeys: String, CodingKey {
        case ability    = "ability"
        case isHidden   = "is_hidden"
        case slot       = "slot"
    }
}

private struct AbilityInternal: Codable {
    let name: String
    let url: URL
    
    enum CodingKeys: String, CodingKey {
        case name   = "name"
        case url    = "url"
    }
}

extension Ability {
    static func mock() -> Ability {
        Ability(ability: AbilityInternal(name: "limber", url: URL(string: "https://pokeapi.co/api/v2/ability/7/")!), isHidden: true, slot: 1)
    }
}
