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
                    .frame(maxHeight: 50)
                
                PokemonSpriteView(holder: self.holder)
                
                HStack(spacing: 0) {
                    if let primaryType = self.holder.primaryType.type {
                        TypeBadgeView(type: primaryType)
                    }
                    
                    if let secondaryType = self.holder.secondaryType.type {
                        TypeBadgeView(type: secondaryType)
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
