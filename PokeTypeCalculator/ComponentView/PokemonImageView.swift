//
//  PokemonImageView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/23/20.
//

import SwiftUI
import Kingfisher

struct PokemonImageView: View {
    
    private let url: URL
    private let imageHeight: CGFloat
    
    init(url: URL, imageHeight: CGFloat = 200) {
        self.url = url
        self.imageHeight = imageHeight
    }
    
    var body: some View {
        KFImage(url)
            .cancelOnDisappear(true)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: imageHeight)
            .clipped()
    }
}

struct PokemonImageView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImageView(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/667.png")!)
    }
}
