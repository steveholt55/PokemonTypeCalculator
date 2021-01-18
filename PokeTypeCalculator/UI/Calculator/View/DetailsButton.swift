//
//  DetailsButton.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/17/21.
//

import SwiftUI

struct DetailsButton: View {
    
    @ObservedObject var holder: PokemonHolder
    @State var showingDetailView = false
    
    let padding: CGFloat = 12
    let imageSize: CGFloat = 32
    var body: some View {
        
        Button(action: {
            self.showingDetailView.toggle()
        }) {
            Text("Details")
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(Color.red)
        }
        .sheet(isPresented: $showingDetailView) {
            DetailView(holder: self.holder)
                .environmentObject(holder)
        }
        
    
    }
}

struct DetailsButton_Previews: PreviewProvider {
    static var previews: some View {
        DetailsButton(holder: PokemonHolder.mock())
    }
}
