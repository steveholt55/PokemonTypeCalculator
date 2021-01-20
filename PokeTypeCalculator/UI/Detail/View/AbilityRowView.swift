//
//  AbilityRowView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/18/21.
//

import SwiftUI

struct AbilityRowView: View {
    
    let ability: Ability
    
    var body: some View {
        
        HStack {
            
            Text(ability.name.capitalized)
                .font(.title2)
            
            if self.ability.isHidden {
                Text("Hidden")
                    .italic()
                    .font(.footnote)
            }
            
        }
    }
}

struct AbilityRowView_Previews: PreviewProvider {
    static var previews: some View {
        AbilityRowView(ability: Ability.mock())
    }
}
