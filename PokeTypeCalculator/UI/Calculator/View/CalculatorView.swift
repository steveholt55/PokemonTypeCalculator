//
//  CalculatorView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 5/18/21.
//

import SwiftUI
import Combine

struct CalculatorView: View {
    
    @ObservedObject var viewModel: CalculatorViewModel
    
    var hasData: Bool {
        self.viewModel.pokemon != nil
    }
    
    var body: some View {
        
        ZStack {
            
            // Main View
            VStack(spacing: 0) {
                PokemonHolderView(viewModel: self.viewModel)
                    .padding(.vertical, 12.0)
                
                if self.hasData {
                    DetailsButton(viewModel: self.viewModel)
                        .padding(.vertical, 12.0)
                    
                    DamageRelationView(viewModel: self.viewModel)
                        .layoutPriority(.greatestFiniteMagnitude)
                }
                
            }
            .edgesIgnoringSafeArea(.bottom)
            .padding(0)
            .onAppear(perform: {
                loadRandomPokemon()
            })
            
            // Only show the FAB, if we have data
            if self.hasData {
                // FAB
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        SearchButton(showSearchViewSubject: self.viewModel.showSearchViewSubject)
                            .padding(.trailing, 16.0)
                            .padding(.bottom, 8.0)
                    }
                }
            }
        }
    }
    
    private func loadRandomPokemon() {
        self.viewModel.getRandomPokemon()
    }
    
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView(viewModel: CalculatorViewModel())
    }
}
