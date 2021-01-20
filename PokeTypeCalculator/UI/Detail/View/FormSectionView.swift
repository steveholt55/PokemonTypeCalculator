//
//  FormSectionView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/19/21.
//

import SwiftUI

struct FormSectionView: View {
    
    @State var pokemon: Pokemon
    
    var body: some View {
        Section(header: SectionHeaderView(headerText: "Forms")) {
            ForEach(pokemon.forms) { form in
                FormRowView(form: form)
            }
        }
    }
}

struct FormSectionView_Previews: PreviewProvider {
    static var previews: some View {
        FormSectionView(pokemon: PokemonHolder.mock().pokemon!)
    }
}

