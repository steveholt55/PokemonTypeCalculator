//
//  StatSectionView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/19/21.
//

import SwiftUI

struct StatSectionView: View {
    
    @State var pokemon: Pokemon
    @State var primaryColor: Color = .primaryRed
    
    var body: some View {
        Section(header: SectionHeaderView(headerText: "Stats")) {
            ForEach(pokemon.stats) { stat in
                StatRowView(stat: stat, primaryColor: self.primaryColor)
            }
        }
    }
}

struct StatSectionView_Previews: PreviewProvider {
    static var previews: some View {
        StatSectionView(pokemon: PokemonHolder.mock().pokemon!)
    }
}
