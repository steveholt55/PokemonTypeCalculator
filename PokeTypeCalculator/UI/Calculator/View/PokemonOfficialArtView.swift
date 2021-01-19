//
//  PokemonOfficialArtView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/18/21.
//

import SwiftUI

struct PokemonOfficialArtView: View {
    
    let imageURL: URL
    
    var body: some View {
        PokemonImageView(url: imageURL)
    }
}

struct PokemonOfficialArtView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonOfficialArtView(imageURL: SpriteImages.mock().frontDefault!)
    }
}
