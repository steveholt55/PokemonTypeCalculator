//
//  PokemonSelectionView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/23/20.
//

import SwiftUI

struct PokemonSelectionView: View {
    
    @ObservedObject var holder: PokemonHolder
    
    var body: some View {
        
        if let selectedName = holder.pokemon?.name {
            Text(selectedName.capitalized)
                .foregroundColor(Color(.label))
                .font(.largeTitle)
                .shadow(radius: 15)
                .padding(EdgeInsets(top: 16, leading: 4, bottom: 16, trailing: 4))
        } else {
            LoadingView()
        }
    }
}

struct PokemonSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        return PokemonSelectionView(holder: PokemonHolder.mock())
    }
}
