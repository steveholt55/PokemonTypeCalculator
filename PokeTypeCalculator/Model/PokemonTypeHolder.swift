//
//  PokemonTypeHolder.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/30/20.
//

struct PokemonTypeHolder: Codable {
    let slot: Int
    let type: PokemonType
    
    enum CodingKeys: String, CodingKey {
        case slot   = "slot"
        case type   = "type"
    }
}

extension PokemonTypeHolder {
    static func mock() -> PokemonTypeHolder {
        PokemonTypeHolder(slot: 1, type: PokemonType.mock())
    }
}
