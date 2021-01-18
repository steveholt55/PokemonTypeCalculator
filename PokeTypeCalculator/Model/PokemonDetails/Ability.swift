//
//  Ability.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/17/21.
//

import Foundation

struct Ability: Codable, Identifiable {
    
    var id: String {
        return name
    }
    
    var name: String {
        _ability.name
    }
    var url: URL {
        _ability.url
    }
    let isHidden: Bool
    let slot: Int
    
    private let _ability: AbilityInternal
    
    enum CodingKeys: String, CodingKey {
        case _ability   = "ability"
        case isHidden   = "is_hidden"
        case slot       = "slot"
    }
}

struct AbilityInternal: Codable {
    let name: String
    let url: URL
    
    enum CodingKeys: String, CodingKey {
        case name       = "name"
        case url        = "url"
    }
}

extension Ability {
    static func mock() -> Ability {
        Ability(isHidden: true, slot: 1, _ability: AbilityInternal(name: "limber", url: URL(string: "https://pokeapi.co/api/v2/ability/7/")!))
    }
}
