//
//  Pokemon.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/22/20.
//

import Foundation

struct Pokemon: Codable, Identifiable {
    var id = UUID()
    let types: [PokemonTypeHolder]

    var displayTypes: [Type] {
        self.types.sorted {
            $0.slot < $1.slot
        }.compactMap {
            Type(rawValue: $0.type.name)
        }
    }
    enum CodingKeys: String, CodingKey {
        case types = "types"
    }
}

struct PokemonTypeHolder: Codable {
    let slot: Int
    let type: PokemonType
    
    enum CodingKeys: String, CodingKey {
        case slot = "slot"
        case type = "type"
    }
}

struct PokemonType: Codable {
    let name: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}

/*
"types": [{
    "slot": 1,
    "type": {
        "name": "normal",
        "url": "https://pokeapi.co/api/v2/type/1/"
    }
}],
*/
