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

extension ListItem: Hashable {
    static func == (lhs: ListItem, rhs: ListItem) -> Bool {
        return lhs.name == rhs.name
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
