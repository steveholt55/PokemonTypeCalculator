//
//  AbilityEffectChangeRow.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/25/21.
//

import SwiftUI

struct AbilityEffectChangeRow: View {
    
    let effect: AbilityEffect
    
    var body: some View {
        Text(effect.shortEffect ?? effect.effect)
    }
}

struct AbilityEffectChangeRow_Previews: PreviewProvider {
    static var previews: some View {
        AbilityEffectChangeRow(effect: AbilityEffect.mock())
    }
}
