//
//  SelectedPokemonView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/23/20.
//

import SwiftUI

struct PokemonHolderView: View {
    
    @ObservedObject var holder: PokemonHolder
    
    var body: some View {
        
            VStack {
                
                SelectedPokemonView(holder: self.holder)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                
                if let officialArtImage = self.holder.pokemon?.sprites.officialArtImageURL {
                    PokemonOfficialArtView(imageURL: officialArtImage)
                }
                
                HStack(spacing: 0) {
                    if let primaryType = self.holder.primaryType.type {
                        TypeBadgeView(type: primaryType)
                            .padding(.horizontal, 8.0)
                    }
                    
                    if let secondaryType = self.holder.secondaryType.type {
                        TypeBadgeView(type: secondaryType)
                            .padding(.horizontal, 8.0)
                    }
                    
                }
        }
    }
}

struct TypeDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        return PokemonHolderView(holder: PokemonHolder.mock())
    }
}
