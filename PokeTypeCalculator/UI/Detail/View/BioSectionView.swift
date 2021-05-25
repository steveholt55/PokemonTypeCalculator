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
        VStack(alignment: .leading, spacing: 4) {
            SectionHeaderView(headerText: "Bio")
            Divider()
                .padding(.bottom, 8)
            ForEach(bio) { item in
                BioRowView(heading: item.name.rawValue, detail: item.value)
                    .padding(.leading, 8)
            }
        }
        .padding(.bottom, 16)
    }
}

struct BioSectionView_Previews: PreviewProvider {
    static var previews: some View {
        FormSectionView(pokemon: PokemonHolder.mock().pokemon!)
    }
}
