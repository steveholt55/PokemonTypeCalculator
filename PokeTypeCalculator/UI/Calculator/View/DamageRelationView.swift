//
//  DamageRelationView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/23/20.
//

import SwiftUI

struct DamageRelationView: View {
    
    @ObservedObject var viewModel: CalculatorViewModel
    
    var body: some View {
        
        if let damageRelation = self.viewModel.primaryType.type?.damageRelation {
            let calculation = DamageRelationCalculation(primaryType: damageRelation, secondaryType: self.viewModel.secondaryType.type?.damageRelation)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(calculation.sections) { section in
                        SectionHeaderView(headerText: section.name)
                        Divider()
                            .padding(.bottom, 8)
                        LazyVGrid(columns: Array(repeating: .init(.flexible(minimum: 40)), count: 2), alignment: .leading, content: {
                            ForEach(section.types) { type in
                                TypeBadgeView(type: type)
                                    .padding(.horizontal, 8.0)
                            }
                        })
                        .padding(.bottom, 16)
                    }
                }
            }
        }
    }
}

struct DamageRelationView_Previews: PreviewProvider {
    
    static var previews: some View {
        let dataViewModel = CalculatorViewModel()
        dataViewModel.pokemon = PokemonHolder.mock().pokemon
        dataViewModel.primaryType = TypeHolder.mockType
        
        return Group {
            DamageRelationView(viewModel: dataViewModel)
                .previewLayout(.sizeThatFits)
        }
    }
}
