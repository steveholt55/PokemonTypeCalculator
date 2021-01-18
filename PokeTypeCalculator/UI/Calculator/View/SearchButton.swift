//
//  SearchButton.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/9/21.
//

import SwiftUI

struct SearchButton: View {
    
    @ObservedObject var holder: PokemonHolder
    @State var showingSearchView = false
    
    let padding: CGFloat = 12
    let imageSize: CGFloat = 32
    
    var body: some View {
        
        
        Button(action: {
            self.showingSearchView.toggle()
        }) {
            Image(systemName:  "magnifyingglass")
                .resizable()
                .foregroundColor(.white)
                .frame(width: imageSize, height: imageSize)
                .padding(.all, padding)
                .background(Color.red)
                .cornerRadius((imageSize + padding * 2) / 2.0)
                .shadow(color: Color.black.opacity(0.3),
                        radius: 3,
                        x: 3,
                        y: 3)
        }
        .sheet(isPresented: $showingSearchView) {
            SearchListView()
                .environmentObject(holder)
        }
        
    }
}

struct SearchButton_Previews: PreviewProvider {
    static var previews: some View {
        SearchButton(holder: PokemonHolder.mock())
    }
}
