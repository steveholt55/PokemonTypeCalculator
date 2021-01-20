//
//  PokemonSpriteView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/9/21.
//

import SwiftUI

struct PokemonSpriteView: View {
    
    @State var pokemon: Pokemon
    
    private let imageHeight: CGFloat = 100
    
    var body: some View {
        
        HStack {
            if let frontDefault = pokemon.sprites.frontDefault {
                PokemonImageView(url: frontDefault, imageHeight: self.imageHeight)
            }
            
            // If no female sprite, just show the shiny sprite
            if let frontSecondary = pokemon.sprites.frontFemale ?? pokemon.sprites.frontShiny {
                PokemonImageView(url: frontSecondary, imageHeight: self.imageHeight)
            }
        }
        
        // Only show a second row if we have both male and female normal sprites
        if pokemon.hasMaleAndFemaleSprites {
            HStack {
                if let frontShiny = pokemon.sprites.frontShiny {
                    PokemonImageView(url: frontShiny, imageHeight: self.imageHeight)
                }
                
                if let frontShinyFemale = pokemon.sprites.frontShinyFemale {
                    PokemonImageView(url: frontShinyFemale, imageHeight: self.imageHeight)
                }
            }
        }
        
        
    }
}

struct PokemonSpriteView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonSpriteView(pokemon: PokemonHolder.mock().pokemon!)
    }
}
