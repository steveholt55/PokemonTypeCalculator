//
//  PokemonSelectionView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/23/20.
//

import SwiftUI

struct PokemonSelectionView: View {
    
    @State var showingSearchView = false
    
    @ObservedObject var holder: PokemonHolder
    
    var body: some View {
        
        Button(action: {
            self.showingSearchView.toggle()
        }) {
            VStack {
                if let selectedName = holder.pokemon?.name {
                    Text(selectedName.capitalized)
                } else {
                    LoadingView()
                }
            }
        }.sheet(isPresented: $showingSearchView) {
            SearchListView()
                .environmentObject(holder)
        }
    }
}

struct PokemonSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        return PokemonSelectionView(holder: PokemonHolder.mock())
    }
}
