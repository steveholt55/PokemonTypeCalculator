//
//  DetailView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/17/21.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var viewModel: DetailsViewModel
    
    private var pokemon: Pokemon {
        viewModel.pokemon
    }
    
    private var primaryColor: Color {
        viewModel.primaryColor
    }
    
    enum DetailSection: String, Identifiable {
        var id: String {
            self.rawValue
        }
        
        case ability
        case bio
        case form
        case stat
        /*
        case game
        case move
        */
    }
    
    var sections: [DetailSection] {
        var showableSection: [DetailSection] = []
        
        showableSection.append(.bio)
        
        if pokemon.hasAbilities {
            showableSection.append(.ability)
        }
        
        if pokemon.hasStats {
            showableSection.append(.stat)
        }
        
        if pokemon.hasForms {
            showableSection.append(.form)
        }
        
        return showableSection
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            VStack {
                Text(pokemon.name.capitalized)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .shadow(radius: 15)
                    .padding(EdgeInsets(top: 16, leading: 4, bottom: 16, trailing: 4))
                
                PokemonSpriteView(pokemon: pokemon)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Rectangle()
                            .fill(LinearGradient(gradient: Gradient(colors: self.viewModel.typeColors), startPoint: .leading, endPoint: .trailing))
                            .shadow(radius: 1))
            
            ScrollView {
                VStack {
                    ForEach(self.sections) { section in
                        switch section {
                        case .ability:
                            AbilitySectionView(pokemon: pokemon)
                        case .bio:
                            BioSectionView(bio: pokemon.bioInfo)
                        case .form:
                            FormSectionView(pokemon: pokemon)
                        case .stat:
                            StatSectionView(pokemon: pokemon, primaryColor: self.primaryColor)
                        }
                    }
                }
                .padding(.top, 16)
                .padding(.trailing)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: DetailsViewModel(pokemon: PokemonHolder.mock().pokemon!, primaryColor: AppColors.red, secondaryColor: nil))
    }
}
