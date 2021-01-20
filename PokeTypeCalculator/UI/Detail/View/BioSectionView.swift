//
//  BioSectionView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/19/21.
//

import SwiftUI

struct BioSectionView: View {
    
    let bio: [BioItem]
    
    var body: some View {
        Section(header: SectionHeaderView(headerText: "Bio")) {
            ForEach(bio) { item in
                BioRowView(heading: item.name.rawValue, detail: item.value)
            }
        }
    }
}

struct BioSectionView_Previews: PreviewProvider {
    static var previews: some View {
        FormSectionView(pokemon: PokemonHolder.mock().pokemon!)
    }
}
