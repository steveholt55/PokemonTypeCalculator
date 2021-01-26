//
//  AbilityDetailView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/24/21.
//

import SwiftUI

struct AbilityDetailView: View {
    
    @ObservedObject var viewModel: AbilityDetailsViewModel
    
    enum DetailSection: String, Identifiable {
        var id: String {
            self.rawValue
        }
        
        case effectChanges
        case effectEntries
    }
    
    var sections: [DetailSection] {
        guard let abilityDetails = self.viewModel.abilityDetails else { return [] }
        
        var showableSection: [DetailSection] = []
        
        if abilityDetails.getEffectChanges().count > 0 {
            showableSection.append(.effectChanges)
        }
        
        if abilityDetails.getEffectEntries().count > 0 {
            showableSection.append(.effectEntries)
        }
        
        return showableSection
    }
    
    var body: some View {
        
        if let abilityDetails = self.viewModel.abilityDetails  {
            List {
                ForEach(self.sections) { section in
                    switch section {
                    case .effectChanges:
                        AbilityEffectChangesSection(effectChanges: abilityDetails.getEffectChanges())
                    case .effectEntries:
                        AbilityEffectEntrySection(effectEntries: abilityDetails.getEffectEntries())
                    }
                }
            }
        } else {
            LoadingView()
        }
    }
}

struct AbilityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AbilityDetailView(viewModel: AbilityDetailsViewModel(Ability.mock()))
    }
}
