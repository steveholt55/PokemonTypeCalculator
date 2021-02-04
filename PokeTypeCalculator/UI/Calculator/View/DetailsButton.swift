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
            HStack {
                Image(systemName: "info.circle")
                    .font(.system(.title))
                    .foregroundColor(AppColors.red)
                
                Text("Details")
                    .foregroundColor(Color(.label))
                    .font(.system(.title3))
                    .fontWeight(.bold)
            }
        }
        .sheet(isPresented: $showingDetailView) {
            if let pokemon = self.holder.pokemon, let color = holder.primaryType.type?.color {
                DetailView(pokemon: pokemon, primaryColor: color)
            }
        }
        
    
    }
}

struct DetailsButton_Previews: PreviewProvider {
    static var previews: some View {
        DetailsButton(holder: PokemonHolder.mock())
    }
}
