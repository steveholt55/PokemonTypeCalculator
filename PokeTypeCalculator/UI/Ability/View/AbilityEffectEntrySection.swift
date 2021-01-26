//
//  AbilityEffectEntrySection.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/25/21.
//

import Foundation
import SwiftUI

struct AbilityEffectEntrySection: View {
    
    @State var effectEntries: [AbilityEffect]
    
    var body: some View {
        Section(header: SectionHeaderView(headerText: "Effect Entries")) {
            ForEach(self.effectEntries) { effect in
                AbilityEffectEntryRow(effect: effect)
            }
        }
    }
}

struct AbilityEffectEntrySection_Previews: PreviewProvider {
    static var previews: some View {
        AbilityEffectEntrySection(effectEntries: [AbilityEffect.mock()])
    }
}
