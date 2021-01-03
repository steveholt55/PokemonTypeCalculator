//
//  DamageRelationView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/23/20.
//

import SwiftUI

struct DamageRelationView: View {
    
    @ObservedObject var holder: PokemonHolder
    
    private let gridItemLayout = [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)]
    
    var body: some View {
        if let damageRelation = self.holder.primaryType.type?.damageRelation {
            let calculation = DamageRelationCalculation(primaryType: damageRelation, secondaryType: self.holder.secondaryType.type?.damageRelation)
            
            List {
                ForEach(calculation.sections) { section in
                    Section(header: Text(section.name)) {
                        LazyVGrid(columns: gridItemLayout, spacing: 0) {
                            ForEach(section.types) { type in
                                TypeBadgeView(type: type)
                                    .frame(height: 80.0)
                            }
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
