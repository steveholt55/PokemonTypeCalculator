//
//  AbilityDetailView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/24/21.
//

import SwiftUI

struct AbilityDetailView: View {
    
    @ObservedObject var viewModel: AbilityDetailsViewModel
    
    var body: some View {
        if let details = self.viewModel.abilityDetails {
            ForEach(details.effectEntries) { ability in
                Text(ability.effect.capitalized)
                    .foregroundColor(Color(.label))
                    .font(.largeTitle)
                    .shadow(radius: 15)
                    .padding(EdgeInsets(top: 16, leading: 4, bottom: 16, trailing: 4))
            }
            
        }
    }
}

struct AbilityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AbilityDetailView(viewModel: AbilityDetailsViewModel(Ability.mock()))
    }
}
