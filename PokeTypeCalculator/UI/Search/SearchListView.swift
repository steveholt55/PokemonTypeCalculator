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
            
            List {
                if viewModel.recents.count > 0 {
                    Section(header: Text("Recent searches")) {
                        ForEach(viewModel.recents) { item in
                            SearchItemRow(item: item)
                                .onTapGesture {
                                    self.viewModel.addRecent(item)
                                    self.holder.name = item.name
                                    self.presentation.wrappedValue.dismiss()
                                }
                        }
                    }
                }
                
                if filteredItems.count > 0 {
                    Section(header: Text("Pokemon")) {
                        ForEach(filteredItems) { item in
                            SearchItemRow(item: item)
                                .onTapGesture {
                                    self.viewModel.addRecent(item)
                                    self.holder.name = item.name
                                    self.presentation.wrappedValue.dismiss()
                                }
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
        }
        
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/60.png")!
        
        let view = SearchListView()
        view.viewModel.recents = [
            ListItem(url: url, name: "Taco"),
            ListItem(url: url, name: "Milk"),
        ]
        view.viewModel.list = [
            ListItem(url: url, name: "Charizard"),
            ListItem(url: url, name: "Pikachu"),
            ListItem(url: url, name: "Mewtwo"),
            ListItem(url: url, name: "Absol"),
        ]
        return view
    }
}

