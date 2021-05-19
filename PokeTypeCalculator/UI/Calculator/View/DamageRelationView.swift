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
            
            List {
                ForEach(calculation.sections) { section in
                    Section(header:SectionHeaderView(headerText: section.name, textColor: .white)
                                .background(viewModel.primaryType.type?.color ?? .black)
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
        DamageRelationView(viewModel: CalculatorViewModel())
    }
}
