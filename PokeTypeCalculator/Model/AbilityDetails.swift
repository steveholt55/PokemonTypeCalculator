//
//  AbilityDetails.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/24/21.
//

import Foundation

struct AbilityDetails: Codable {
    let effectEntries: [AbilityEffect]
    
    enum CodingKeys: String, CodingKey {
        case effectEntries    = "effect_entries"
    }
    
}
