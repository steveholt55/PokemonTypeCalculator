//
//  AbilityEffectChanges.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/25/21.
//

import Foundation

struct AbilityEffectChanges: Codable, Identifiable {
    let id = UUID()
    let effectEntries: [AbilityEffect]
    let version: Generation
    
    func getEffectEntries() -> [AbilityEffect] {
        self.effectEntries.filter { $0.language.isCurrentLocaleOrDefault() }
    }
}

extension AbilityEffectChanges {
    enum CodingKeys: String, CodingKey {
        case effectEntries  = "effect_entries"
        case version        = "version_group"
    }
}

extension AbilityEffectChanges {
    static func mock() -> AbilityEffectChanges {
        AbilityEffectChanges(effectEntries: [AbilityEffect.mock()], version: Generation.mock())
    }
}
