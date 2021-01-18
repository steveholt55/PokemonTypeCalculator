//
//  DetailView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/17/21.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var holder: PokemonHolder = PokemonHolder()
    
    var body: some View {
        VStack {
            Text("Abilities")
            
            List {
                ForEach(holder.pokemon?.abilities ?? []) { ability in
                    Text(ability.name.capitalized)
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
