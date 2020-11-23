//
//  TypeCalculatorView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/19/20.
//

import SwiftUI
import Combine

struct TypeCalculatorView: View {
    
    // Type Selection
    @State private var showingPrimaryTypeSelection = false
    @State private var showingSecondaryTypeSelection = false
    
    // Search
    @ObservedObject var holder: PokemonHolder = PokemonHolder()
    @State private var showingSearchView = false
    
    @State private var isLoadingPokemon = true
    
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        VStack {
            
            Button(action: {
                self.showingSearchView.toggle()
            }) {
                if let selectedName = holder.name {
                    Text(selectedName.capitalized)
                } else {
                    Text("Search Pokemon")
                }
            }.sheet(isPresented: $showingSearchView) {
                SearchListView()
                    .environmentObject(holder)
            }
            
            HStack {
                
                TypeButtonView(type: self.holder.primaryType).onTapGesture {
                    self.showingPrimaryTypeSelection = true
                }
                .actionSheet(isPresented: $showingPrimaryTypeSelection, content: {
                    typeSelectionActionSheet(isPrimary: true)
                })
                
                // Only show type 2 option if type 1 is set
                if self.holder.primaryType.type != nil {
                    TypeButtonView(type: self.holder.secondaryType).onTapGesture {
                        self.showingSecondaryTypeSelection = true
                    }
                    .actionSheet(isPresented: $showingSecondaryTypeSelection, content: {
                        typeSelectionActionSheet(isPrimary: false)
                    })
                }
            }.padding(8)
            
            if let damageRelation = self.holder.primaryType.type?.damageRelation {
                let calculation = DamageRelationCalculation(primaryType: damageRelation, secondaryType: self.holder.secondaryType.type?.damageRelation)
                
                List {
                    ForEach(calculation.sections) { section in
                        Section(header: Text(section.name)) {
                            ScrollView {
                                LazyVGrid(columns: gridItemLayout, spacing: 8) {
                                    ForEach(section.types) { type in
                                        TypeBadgeView(type: type)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            if isLoadingPokemon {
                
            } else {
                Spacer()
            }
        }
    }
    
    
    func typeSelectionActionSheet(isPrimary: Bool) -> ActionSheet {
        
        let buttons: [ActionSheet.Button] = Type.allCases.compactMap {type in
            
            // Make sure we can't have primary and secondary types be the same
            if !isPrimary && self.holder.primaryType.type == type {
                return nil
            }
            
            // Create a default button of the type
            return .default(Text(type.rawValue.uppercased())) {
                if isPrimary {
                    self.holder.primaryType.type = type
                } else {
                    self.holder.secondaryType.type = type
                }
                
            }
        }
        let actionSheet = ActionSheet(title: Text("Type Selection"), message: Text("Select a type"), buttons: buttons + [.cancel()])
        return actionSheet
    }
}

struct TypeCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        let holder = TypeHolder.mockType
        let view = TypeCalculatorView()
        view.holder.primaryType.type = holder.type
        return view
    }
}
