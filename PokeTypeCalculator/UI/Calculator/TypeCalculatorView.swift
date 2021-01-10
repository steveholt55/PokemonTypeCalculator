//
//  TypeCalculatorView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/19/20.
//

import SwiftUI
import Combine

struct TypeCalculatorView: View {
    
    // Search
    @ObservedObject var holder: PokemonHolder = PokemonHolder()
    
    var body: some View {
        
        ZStack {
            
            // Main View
            VStack(spacing: 0) {
                PokemonHolderView(holder: self.holder)
                    .padding(.vertical, 12.0)
                
                DamageRelationView(holder: self.holder)
                    .layoutPriority(.greatestFiniteMagnitude)
                
            }
            .edgesIgnoringSafeArea(.bottom)
            .padding(0)
            .onAppear(perform: {
                loadRandomPokemon()
            })
            
            // Only show the FAB, if we have data
            if self.holder.pokemon != nil {
                // FAB
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        SearchButton(holder: self.holder)
                            .padding(.trailing, 16.0)
                            .padding(.bottom, 8.0)
                    }
                }
            }
        }
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
