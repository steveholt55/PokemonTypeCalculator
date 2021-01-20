//
//  Form.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/19/21.
//

import Foundation

struct Form: Codable, Identifiable {
    
    // Identifiable
    var id: String { name }
    
    let name: String
    let url: URL
    
    enum CodingKeys: String, CodingKey {
        case name       = "name"
        case url        = "url"
    }
}

extension Form {
    static func mock() -> Form {
        Form(name: "blastoise", url: URL(string: "https://pokeapi.co/api/v2/pokemon-form/9")!)
    }
}
