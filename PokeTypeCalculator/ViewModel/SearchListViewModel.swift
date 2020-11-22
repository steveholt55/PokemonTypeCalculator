//
//  SearchListViewModel.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/22/20.
//

import Foundation
import Combine

class SearchListViewModel: ObservableObject {
    
    @Published var list: [ListItem] = []
    var cancellationToken: AnyCancellable?
    
    init() {
        getList()
    }
    
}

extension SearchListViewModel {
    
    // Subscriber implementation
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
