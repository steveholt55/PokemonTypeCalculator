//
//  PokemonAPI.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/22/20.
//

import Foundation
import Combine

enum PokemonAPI {
    static let apiClient = APIClient()
    static let baseUrl = URL(string: "https://pokeapi.co/api/v2/")!
}

enum APIPath: String {
    case pokemon = "pokemon"
}

extension PokemonAPI {
    
    static func getList() -> AnyPublisher<ListResponse, Error> {
        
        guard var components = URLComponents(url: baseUrl.appendingPathComponent(APIPath.pokemon.rawValue), resolvingAgainstBaseURL: true)
            else { fatalError("Couldn't create URLComponents") }
        components.queryItems = [URLQueryItem(name: "limit", value: "10000")]
        
        let request = URLRequest(url: components.url!)
        
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    static func getPokemon(_ name: String) -> AnyPublisher<Pokemon, Error> {
        
        guard var components = URLComponents(url: baseUrl.appendingPathComponent(APIPath.pokemon.rawValue), resolvingAgainstBaseURL: true)
            else { fatalError("Couldn't create URLComponents") }
        components.path.append("/\(name)")
        
        let request = URLRequest(url: components.url!)
        
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
