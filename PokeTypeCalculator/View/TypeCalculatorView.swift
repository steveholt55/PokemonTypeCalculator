//
//  TypeCalculatorView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/19/20.
//

import SwiftUI

struct TypeCalculatorView: View {
    
    @ObservedObject private var primaryType: TypeHolder = TypeHolder()
    @ObservedObject private var secondaryType: TypeHolder = TypeHolder()
    
    @State private var showingPrimaryTypeSelection = false
    @State private var showingSecondaryTypeSelection = false
    
    @State private var sections: [TypeSection] = [
        TypeSection(name: "Super Effective", types: [.grass]),
        TypeSection(name: "Normal", types: [.ghost])
    ]
    
    @State private var types: [Type] = [.grass]
    @State private var normalTypes: [Type] = [.fire, .water]
    
    var body: some View {
        
        VStack {
            
            HStack {
                TypeButtonView(type: primaryType).onTapGesture {
                    self.showingPrimaryTypeSelection = true
                }
                .actionSheet(isPresented: $showingPrimaryTypeSelection, content: {
                    typeSelectionActionSheet(isPrimary: true)
                })
                
                // Only show type 2 option if type 1 is set
                if primaryType.type != nil {
                    TypeButtonView(type: secondaryType).onTapGesture {
                        self.showingSecondaryTypeSelection = true
                    }
                    .actionSheet(isPresented: $showingSecondaryTypeSelection, content: {
                        typeSelectionActionSheet(isPrimary: false)
                    })
                }
            }.padding(8)
            
            List {
                ForEach(sections) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.types) { type in
                            TypeBadgeView(type: type)
                        }
                    }
                }
            }
            
            Spacer()
        }
    }
    
    
    func typeSelectionActionSheet(isPrimary: Bool) -> ActionSheet {
        
        let buttons: [ActionSheet.Button] = Type.allCases.compactMap {type in
            
            // Make sure we can't have primary and secondary types be the same
            if !isPrimary && primaryType.type == type {
                return nil
            }
            
            // Create a default button of the type
            return .default(Text(type.rawValue.uppercased())) {
                if isPrimary {
                    self.primaryType.type = type
                } else {
                    self.secondaryType.type = type
                }
                
            }
        }
        let actionSheet = ActionSheet(title: Text("Type Selection"), message: Text("Select a type"), buttons: buttons + [.cancel()])
        return actionSheet
    }
}

struct TypeCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        TypeCalculatorView()
    }
}
