//
//  AbilityEffectChangesSection.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/25/21.
//

import Foundation
import SwiftUI

struct AbilityEffectChangesSection: View {
    
    @State var effectChanges: [AbilityEffectChanges]
    
    var body: some View {
        Section(header: SectionHeaderView(headerText: "Effect Changes")) {
            ForEach(self.effectChanges) { effect in
                ForEach(effect.getEffectEntries()) { entry in
                    AbilityEffectChangeRow(effect: entry)
                }
            }
        }
    }
}

struct AbilityEffectChangesSection_Previews: PreviewProvider {
    static var previews: some View {
        AbilityEffectChangesSection(effectChanges: [AbilityEffectChanges.mock()])
    }
}
