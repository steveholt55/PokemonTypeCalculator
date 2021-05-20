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
    
    init(pokemon: Pokemon, primaryColor: Color) {
        self.pokemon = pokemon
        self.primaryColor = primaryColor
    }
    
}
