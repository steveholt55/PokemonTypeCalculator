//
//  AbilityEffect.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/24/21.
//

import Foundation

struct AbilityEffect: Codable, Identifiable {
    let id = UUID()
    let effect: String
    let language: Language
    let shortEffect: String
    
    enum CodingKeys: String, CodingKey {
        case effect
        case language
        case shortEffect    = "short_effect"
    }
    
}
