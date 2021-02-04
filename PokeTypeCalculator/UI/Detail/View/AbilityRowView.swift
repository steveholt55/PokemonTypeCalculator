//
//  AbilityRowView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/18/21.
//

import SwiftUI

struct AbilityRowView: View {
    
    let ability: Ability
    
    @State var showingDetailView = false
    
    var body: some View {
        
        HStack {
            
            Text(ability.name.capitalized)
                .font(.title2)
            
            if self.ability.isHidden {
                Text("Hidden")
                    .italic()
                    .font(.footnote)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
        }
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .onTapGesture {
            self.showingDetailView.toggle()
        }
        .sheet(isPresented: $showingDetailView) {
            AbilityDetailView(viewModel: AbilityDetailsViewModel(self.ability))
        }
    }
}

struct AbilityRowView_Previews: PreviewProvider {
    static var previews: some View {
        AbilityRowView(ability: Ability.mock())
    }
}
