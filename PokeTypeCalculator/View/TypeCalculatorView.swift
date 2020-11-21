//
//  TypeCalculatorView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/19/20.
//

import SwiftUI

struct TypeCalculatorView: View {
    
    @State private var sections: [TypeSection] = [
        TypeSection(name: "Types", types: [.grass]),
        TypeSection(name: "Normal", types: [.ghost])
    ]
    
    @State private var types: [Type] = [.grass]
    @State private var normalTypes: [Type] = [.fire, .water]
    
    var body: some View {
        
        VStack {
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
}

struct TypeCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        TypeCalculatorView()
    }
}
