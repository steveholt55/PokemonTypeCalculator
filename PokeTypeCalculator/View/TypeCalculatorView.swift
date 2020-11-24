//
//  TypeCalculatorView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/19/20.
//

import SwiftUI
import Combine

struct TypeCalculatorView: View {
    
    // Type Selection
    @State private var showingPrimaryTypeSelection = false
    @State private var showingSecondaryTypeSelection = false
    
    // Search
    @ObservedObject var holder: PokemonHolder = PokemonHolder()
    
    var body: some View {
        
        VStack {
            
            PokemonSelectionView(holder: self.holder)
            
            PokemonHolderView(holder: self.holder)
            
            DamageRelationView(holder: self.holder)
            
            // Make stuff float to top if we have data
            if self.holder.pokemon != nil {
                Spacer()
            }
            
        }.onAppear(perform: {
            loadRandomPokemon()
        })
    }
    
    private func loadRandomPokemon() {
        self.holder.getRandomPokemon()
    }
    
}

struct TypeCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        let holder = TypeHolder.mockType
        let view = TypeCalculatorView()
        view.holder.primaryType.type = holder.type
        return view
    }
}
