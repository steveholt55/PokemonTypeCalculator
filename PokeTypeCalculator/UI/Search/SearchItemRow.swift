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
            .font(.headline)
    }
}

struct SearchItemRow_Previews: PreviewProvider {
    static var previews: some View {
        SearchItemRow(item: ListItem(name: "Charizard"))
    }
}
