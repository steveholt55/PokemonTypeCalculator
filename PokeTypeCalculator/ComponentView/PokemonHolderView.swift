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
