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
        Section(header: SectionHeaderView(headerText: "Abilities")) {
            ForEach(pokemon.abilities) { ability in
                AbilityRowView(ability: ability)
            }
        }
    }
}

struct AbilitySectionView_Previews: PreviewProvider {
    static var previews: some View {
        AbilitySectionView(pokemon: PokemonHolder.mock().pokemon!)
    }
}
