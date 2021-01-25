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
                    Section(header:SectionHeaderView(headerText: section.name, textColor: .white)
                                .background(holder.primaryType.type?.color ?? .black)
                                .listRowInsets(EdgeInsets(.zero))
                                
                    )
                    {
                        ForEach(section.types) { type in
                            TypeBadgeView(type: type)
                                .padding(.trailing, 8.0)
                        }
                    }
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
