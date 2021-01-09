//
//  PokemonType.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/30/20.
//

struct PokemonType: Codable {
    let name: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}
