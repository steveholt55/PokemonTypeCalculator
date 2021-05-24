//
//  DetailsViewModel.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 5/19/21.
//

import Combine
import SwiftUI

class DetailsViewModel: ObservableObject {
    
    let pokemon: Pokemon
    let primaryColor: Color
    let secondaryColor: Color?
    
    let typeColors: [Color]
    
    init(pokemon: Pokemon, primaryColor: Color, secondaryColor: Color?) {
        self.pokemon = pokemon
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
        self.typeColors = [primaryColor, secondaryColor].compactMap { $0 }
    }
    
}
