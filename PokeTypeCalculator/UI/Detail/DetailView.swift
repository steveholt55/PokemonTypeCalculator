//
//  DetailView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/17/21.
//

import SwiftUI

struct DetailView: View {
    
    @State var pokemon: Pokemon
    
    enum DetailSection: String, Identifiable {
        var id: String {
            self.rawValue
        }
        
        case ability
    }
    
    @State var sections: [DetailSection] = []
    
    var body: some View {
        
        VStack {
            
            Text(pokemon.name.capitalized)
                .foregroundColor(Color(.label))
                .font(.largeTitle)
                .shadow(radius: 15)
                .padding(EdgeInsets(top: 16, leading: 4, bottom: 16, trailing: 4))
            
            List {
                AbilitySectionView(pokemon: pokemon)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(pokemon: PokemonHolder.mock().pokemon!)
    }
}
