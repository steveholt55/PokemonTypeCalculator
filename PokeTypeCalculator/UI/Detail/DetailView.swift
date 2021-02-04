//
//  DetailView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/17/21.
//

import SwiftUI

struct DetailView: View {
    
    @State var pokemon: Pokemon
    @State var primaryColor: Color = AppColors.red
    
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
                    .shadow(radius: 15)
                    .padding(EdgeInsets(top: 16, leading: 4, bottom: 16, trailing: 4))
                
                PokemonSpriteView(pokemon: pokemon)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(self.primaryColor)
            
            List {
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
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(pokemon: PokemonHolder.mock().pokemon!)
    }
}
