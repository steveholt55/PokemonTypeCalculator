//
//  AbilityDetailsViewModel.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/25/21.
//

import Foundation
import Combine

class AbilityDetailsViewModel: ObservableObject {
    
    @Published var abilityDetails: AbilityDetails?
    let ability: Ability
    
    var cancellationToken: AnyCancellable?
    
    init(_ ability: Ability) {
        self.ability = ability
        getDetails(ability)
    }
    
    func getDetails(_ ability: Ability) {
        cancellationToken = PokemonAPI.getAbilityDetails(ability)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    self.abilityDetails = $0
                  })
    }
    
}
