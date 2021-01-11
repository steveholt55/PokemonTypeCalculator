//
//  DamageRelationSectionHeader.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/9/21.
//

import SwiftUI

struct DamageRelationSectionHeader: View {
    
    let headerText: String
    
    var body: some View {
        Text(headerText.capitalized)
            .textCase(nil)
            .font(.headline)
            .padding(.all, 8.0)
    }
}

struct DamageRelationSectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        DamageRelationSectionHeader(headerText: "Takes 1X From")
    }
}
