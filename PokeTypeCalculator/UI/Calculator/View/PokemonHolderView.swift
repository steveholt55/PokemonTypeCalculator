//
//  SelectedPokemonView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/23/20.
//

import SwiftUI

struct PokemonHolderView: View {
    
    @ObservedObject var viewModel: CalculatorViewModel
    
    var body: some View {
        
            VStack {
                
                SelectedPokemonView(viewModel: self.viewModel)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                
                if let officialArtImage = self.viewModel.officialArtImage {
                    PokemonOfficialArtView(imageURL: officialArtImage)
                }
        }
    }
}

struct PokemonHolderView_Previews: PreviewProvider {
    
    static var previews: some View {
        let loadingViewModel = CalculatorViewModel()
        let dataViewModel = CalculatorViewModel()
        dataViewModel.pokemon = PokemonHolder.mock().pokemon
        dataViewModel.primaryType = TypeHolder.mockType
        
        return Group {
            PokemonHolderView(viewModel: loadingViewModel)
                .previewLayout(.fixed(width: 320, height: 320))
            PokemonHolderView(viewModel: dataViewModel)
                .previewLayout(.sizeThatFits)
        }
    }
}
