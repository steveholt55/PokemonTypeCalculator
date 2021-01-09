//
//  DamageRelationView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/23/20.
//

import SwiftUI

struct DamageRelationView: View {
    
    @ObservedObject var holder: PokemonHolder
    
    var body: some View {
        if let damageRelation = self.holder.primaryType.type?.damageRelation {
            let calculation = DamageRelationCalculation(primaryType: damageRelation, secondaryType: self.holder.secondaryType.type?.damageRelation)
            
            List {
                ForEach(calculation.sections) { section in
                    Section(header: DamageRelationSectionHeader(string: section.name)) {
                        ForEach(section.types) { type in
                            TypeBadgeView(type: type)
                        }
                    }
                    .listRowInsets(.init())
                }
            }
        }
    }
}

struct DamageRelationView_Previews: PreviewProvider {
    static var previews: some View {
        DamageRelationView(holder: PokemonHolder.mock())
    }
}
