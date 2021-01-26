//
//  AbilityEffectEntryRow.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/25/21.
//

import SwiftUI

struct AbilityEffectEntryRow: View {
    
    let effect: AbilityEffect
    
    var body: some View {
        Text(effect.shortEffect ?? effect.effect)
    }
}

struct AbilityEffectEntryRow_Previews: PreviewProvider {
    static var previews: some View {
        AbilityEffectEntryRow(effect: AbilityEffect.mock())
    }
}
