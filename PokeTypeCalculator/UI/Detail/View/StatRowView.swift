//
//  StatRowView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/19/21.
//

import SwiftUI

struct StatRowView: View {
    
    let stat: Stat
    
    var body: some View {
        
        HStack {
            
            Text(stat.name.rawValue.capitalized)
                .font(.title2)
            
            Text("-")
                .font(.title2)
            
            Text("\(stat.baseStat)")
                .font(.title3)
            
        }
        .padding(.horizontal, 8.0)
    }
}

struct StatRowView_Previews: PreviewProvider {
    static var previews: some View {
        StatRowView(stat: Stat.mock())
    }
}
