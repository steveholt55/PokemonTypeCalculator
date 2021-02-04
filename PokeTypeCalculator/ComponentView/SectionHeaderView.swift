//
//  SectionHeaderView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/18/21.
//

import SwiftUI

struct SectionHeaderView: View {
    
    let headerText: String
    var textColor: Color = Color(.label)
    
    var body: some View {
        HStack {
            
            Text(headerText.capitalized)
                .foregroundColor(textColor)
                .font(.headline)
                .fontWeight(.bold)
                .textCase(nil)
                .padding(.all, 8.0)
            
            // Make it full width
            Spacer()
        }
    }
}

struct SectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeaderView(headerText: "Takes 1X From")
    }
}
