//
//  BioRowView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/19/21.
//

import SwiftUI

struct BioRowView: View {
    
    let heading: String
    let detail: String
    
    var body: some View {
        
        HStack {
            Text("\(heading.capitalized):")
                .font(.title2)
            
            Text(detail.capitalized)
                .font(.title3)
        }
    }
}

struct BioRowView_Previews: PreviewProvider {
    static var previews: some View {
        BioRowView(heading: "Height", detail: "300")
    }
}
