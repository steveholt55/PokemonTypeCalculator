//
//  ListItem.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/22/20.
//

import Foundation

struct ListItem: Codable, Identifiable {
    var id = UUID()
    let name: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}
