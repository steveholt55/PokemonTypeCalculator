//
//  SearchListView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/22/20.
//

import SwiftUI

struct SearchListView: View {
    
    @ObservedObject var viewModel = SearchListViewModel()
    
    var body: some View {
        List(viewModel.list) { item in
            HStack {
                VStack(alignment: .leading) {
                    Text(item.name.capitalized)
                        .font(.headline)
                }
            }
        }
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView()
    }
}

