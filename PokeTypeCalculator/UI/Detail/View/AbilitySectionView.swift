//
//  AbilitySectionView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/18/21.
//

import SwiftUI

struct AbilitySectionView: View {
    
    @State var pokemon: Pokemon
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            SectionHeaderView(headerText: "Abilities")
            Divider()
            ForEach(pokemon.abilities) { ability in
                AbilityRowView(ability: ability)
                    .padding(.top, 8)
                    .padding(.leading, 8)
            }
        }
        .padding(.bottom, 16)
    }
}

struct AbilitySectionView_Previews: PreviewProvider {
    static var previews: some View {
        AbilitySectionView(pokemon: PokemonHolder.mock().pokemon!)
    }
}
