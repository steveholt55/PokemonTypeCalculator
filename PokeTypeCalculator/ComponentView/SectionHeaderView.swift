//
//  SectionHeaderView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/18/21.
//

import SwiftUI

struct SectionHeaderView: View {
    
    let headerText: String
    
    var body: some View {
        Text(headerText.capitalized)
            .textCase(nil)
            .font(.headline)
            .padding(.all, 8.0)
    }
}

struct SectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeaderView(headerText: "Takes 1X From")
    }
}
