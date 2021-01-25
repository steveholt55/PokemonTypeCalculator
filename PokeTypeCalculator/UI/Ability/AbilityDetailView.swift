//
//  AbilityDetailView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/24/21.
//

import SwiftUI

struct AbilityDetailView: View {
    
    @State var ability: Ability
    
    var body: some View {
        
        Text(ability.name.capitalized)
            .foregroundColor(Color(.label))
            .font(.largeTitle)
            .shadow(radius: 15)
            .padding(EdgeInsets(top: 16, leading: 4, bottom: 16, trailing: 4))
    }
}

struct AbilityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AbilityDetailView(ability: Ability.mock())
    }
}
