//
//  AbilityDetails.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/24/21.
//

import Foundation

struct AbilityDetails: Codable {
    let effectChanges: [AbilityEffectChanges]
    let effectEntries: [AbilityEffect]
    
    func getEffectChanges() -> [AbilityEffectChanges] {
        self.effectChanges.filter { $0.getEffectEntries().count > 0 }
    }
    
    func getEffectEntries() -> [AbilityEffect] {
        self.effectEntries.filter { $0.language.isCurrentLocaleOrDefault() }
    }
}

extension AbilityDetails {
    enum CodingKeys: String, CodingKey {
        case effectChanges    = "effect_changes"
        case effectEntries    = "effect_entries"
    }
}
