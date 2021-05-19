//
//  SelectedPokemonView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/23/20.
//

import SwiftUI

struct SelectedPokemonView: View {
    
    @ObservedObject var viewModel: CalculatorViewModel
    
    var body: some View {
        
        if let selectedName = viewModel.pokemon?.name {
            ZStack {
                
                if let primaryType = viewModel.primaryType.type {
                    Ellipse()
                        .trim(from: 0, to: 0.5)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .offset(y: -100)
                        .foregroundColor(primaryType.color)
                        .shadow(radius: 1)
                        .overlay(Text(selectedName.capitalized)
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .fontWeight(.black)
                                    .padding(EdgeInsets(top: 16, leading: 4, bottom: 16, trailing: 4)))
                }
                
            }.scaledToFill()
        } else {
            LoadingView()
        }
    }
}

struct SelectedPokemonView_Previews: PreviewProvider {
    static var previews: some View {
        return SelectedPokemonView(viewModel: CalculatorViewModel())
    }
}
