//
//  PokemonImageView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/23/20.
//

import SwiftUI

struct PokemonImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image: UIImage = UIImage()
    let imageHeight: CGFloat
    
    init(url:URL, imageHeight: CGFloat = 200) {
        self.imageLoader = ImageLoader(url:url)
        self.imageHeight = imageHeight
    }
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height:self.imageHeight)
            .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
            }
    }
}

struct PokemonImageView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImageView(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/667.png")!)
    }
}
