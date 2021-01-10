//
//  SearchItemRow.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/24/20.
//

import SwiftUI

struct SearchItemRow: View {
    
    @State var item: ListItem
    
    var body: some View {
        Text(item.name.capitalized)
            .padding(.horizontal, 8.0)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .font(.title3)
            .background(Color(UIColor.secondarySystemGroupedBackground)) // Hack to make full row clickable instead of just the text
    }
}

struct SearchItemRow_Previews: PreviewProvider {
    static var previews: some View {
        SearchItemRow(item: ListItem(name: "Charizard"))
    }
}
