//
//  Generation.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/24/21.
//

import Foundation

struct Generation: Codable {
    let name: String
    let url: URL
}

extension Generation {
    static func mock() -> Generation {
        Generation(name: "ruby", url: URL(string: "https://pokeapi.co/api/v2/generation/3/")!)
    }
}
