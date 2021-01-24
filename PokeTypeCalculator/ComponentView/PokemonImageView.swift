//
//  PokemonImageView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/23/20.
//

import SwiftUI

struct PokemonImageView: View {
    
    @ObservedObject var imageLoader: ImageLoader
    @State var image: UIImage = UIImage()
    private let imageHeight: CGFloat
    
    init(url:URL, imageHeight: CGFloat = 200) {
        self.imageLoader = ImageLoader(url:url)
        self.imageHeight = imageHeight
    }
    
    var body: some View {
        
        ZStack {
            
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height:self.imageHeight)
                .onReceive(imageLoader.didChange) { image in
                    self.image = image
                }
                .onAppear() {
                    self.image = self.imageLoader.image
                }
            
            // Show loading indicator if image isn't loaded yet
            if image == UIImage() {
                LoadingView()
            }
        }
    }
}

struct PokemonImageView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImageView(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/667.png")!)
    }
}
