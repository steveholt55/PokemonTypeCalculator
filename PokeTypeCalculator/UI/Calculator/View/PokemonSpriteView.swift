//
//  PokemonSpriteView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/9/21.
//

import SwiftUI

struct PokemonSpriteView: View {
    
    @ObservedObject var holder: PokemonHolder
    
    var body: some View {
        
        HStack {
            if let frontDefault = holder.pokemon?.sprites.frontDefault {
                PokemonImageView(url: frontDefault)
            }
            
            // If no female sprite, just show the shiny sprite
            if let frontSecondary = holder.pokemon?.sprites.frontFemale ?? holder.pokemon?.sprites.frontShiny {
                PokemonImageView(url: frontSecondary)
            }
        }
        
        // Only show a second row if we have both male and female normal sprites
        if holder.pokemon?.hasMaleAndFemaleSprites ?? true {
            HStack {
                if let frontShiny = holder.pokemon?.sprites.frontShiny {
                    PokemonImageView(url: frontShiny)
                }
                
                if let frontShinyFemale = holder.pokemon?.sprites.frontShinyFemale {
                    PokemonImageView(url: frontShinyFemale)
                }
            }
        }
        
        
    }
}

struct PokemonSpriteView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonSpriteView(holder: PokemonHolder.mock())
    }
}
