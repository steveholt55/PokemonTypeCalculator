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
            
            if let sprite1 = holder.pokemon?.sprites.frontDefault {
                PokemonImageView(url: sprite1)
            }
            if let sprite2 = holder.pokemon?.sprites.frontShiny {
                PokemonImageView(url: sprite2)
            }
            
            HStack {
                if let primaryType = self.holder.primaryType {
                    TypeButtonView(type: primaryType)
                }
                
                if let secondaryType = self.holder.secondaryType {
                    TypeButtonView(type: secondaryType)
                }
                
            }
        }.padding(8)
    }
}

struct TypeDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        return PokemonHolderView(holder: PokemonHolder.mock())
    }
}
