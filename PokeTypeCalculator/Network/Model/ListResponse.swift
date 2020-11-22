//
//  ListResponse.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/22/20.
//

import Foundation

struct ListResponse: Codable {
    let results: [ListItem]

    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}
