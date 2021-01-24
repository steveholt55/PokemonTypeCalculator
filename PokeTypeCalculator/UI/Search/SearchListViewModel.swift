//
//  SearchListViewModel.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/22/20.
//

import Foundation
import Combine

class SearchListViewModel: ObservableObject {
    
    private let recentUserDefaultsKey = "recentUserDefaultsKey"
    
    @Published var recents: [ListItem] = []
    @Published var list: [ListItem] = []
    
    var cancellationToken: AnyCancellable?
    
    init() {
        self.recents = ((UserDefaults.standard.array(forKey: self.recentUserDefaultsKey) as? [String]) ?? []).map { ListItem(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/69.png")!, name: $0) }
        getList()
    }
    
    func addRecent(_ listItem: ListItem) {
        if !self.recents.contains(listItem) {
            self.recents.insert(listItem, at: 0)
            self.recents = Array(self.recents.prefix(5))
            UserDefaults.standard.set(recents.map { $0.name }, forKey: self.recentUserDefaultsKey)
        }
    }
    
}

extension SearchListViewModel {
    
    func getList() {
        cancellationToken = PokemonAPI.getList()
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    self.list = $0.results
                  })
    }
    
}
