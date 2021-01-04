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
                
                PokemonSelectionView(holder: self.holder)
                    .frame(maxHeight: 50)
                
                HStack {
                    if let frontDefault = holder.pokemon?.sprites.frontDefault {
                        PokemonImageView(url: frontDefault)
                    }
                    
                    if let frontFemale = holder.pokemon?.sprites.frontFemale {
                        PokemonImageView(url: frontFemale)
                    }
                }
                
                HStack {
                    
                    if let frontShiny = holder.pokemon?.sprites.frontShiny {
                        PokemonImageView(url: frontShiny)
                    }
                    
                    if let frontShinyFemale = holder.pokemon?.sprites.frontShinyFemale {
                        PokemonImageView(url: frontShinyFemale)
                    }
                }
                
                HStack(spacing: 0) {
                    if let primaryType = self.holder.primaryType.type {
                        TypeBadgeView(type: primaryType)
                            .frame(maxWidth: .infinity)
                    }
                    
                    if let secondaryType = self.holder.secondaryType.type {
                        TypeBadgeView(type: secondaryType)
                            .frame(maxWidth: .infinity)
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
