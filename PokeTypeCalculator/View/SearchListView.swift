//
//  SearchListView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/22/20.
//

import SwiftUI

struct SearchListView: View {
    
    @State var searchText: String = ""
    
    @ObservedObject var viewModel = SearchListViewModel()
    
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var holder: PokemonHolder
    
    var body: some View {
        VStack {
            
            SearchBarView(text: $searchText)
                .padding(.top, 8)
            
            let filteredItems = viewModel.list.filter { searchText.isEmpty ? true : $0.name.lowercased().contains(searchText.lowercased())
            }
            
            List(filteredItems) { item in
                Text(item.name.capitalized).font(.headline)
                    .onTapGesture {
                        self.holder.name = item.name
                        self.presentation.wrappedValue.dismiss()
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

