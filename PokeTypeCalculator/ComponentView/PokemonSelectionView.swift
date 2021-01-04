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
            VStack(spacing: 0) {
                if let selectedName = holder.pokemon?.name {
                    Text(selectedName.capitalized)
                        .foregroundColor(Color(.label))
                        .font(.largeTitle)
                        .shadow(radius: 15)
                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                } else {
                    LoadingView()
                }
            }
        }
        .foregroundColor(Color(.systemBackground))
        .sheet(isPresented: $showingSearchView) {
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
