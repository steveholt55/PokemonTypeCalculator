//
//  Stat.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/19/21.
//

import Foundation

struct Stat: Codable, Identifiable {
    
    enum StatName: String, Codable {
        case hp
        case attack
        case defense
        case specialAttack = "special-attack"
        case specialDefense = "special-defense"
        case speed
    }
    
    // Identifiable
    var id: String { name.rawValue }
    
    // Internal Stat Data
    private let stat: StatInternal
    var name: StatName { stat.name }
    var url: URL { stat.url }
    
    let baseStat: Int
    let effort: Int
    
    enum CodingKeys: String, CodingKey {
        case baseStat   = "base_stat"
        case effort     = "effort"
        case stat       = "stat"
    }
}

fileprivate struct StatInternal: Codable {
    
    let name: Stat.StatName
    let url: URL
    
    enum CodingKeys: String, CodingKey {
        case name       = "name"
        case url        = "url"
    }
}

extension Stat {
    static func mock() -> Stat {
        Stat(stat: StatInternal(name: .hp, url: URL(string: "https://pokeapi.co/api/v2/stat/6/")!), baseStat: 2, effort: 0)
    }
}
