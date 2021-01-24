//
//  ListItem.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/22/20.
//

import Foundation

struct ListItem: Codable, Identifiable {
    
    var id = UUID()
    let url: URL
    let name: String

    private var number: Int? {
        return Int(url.lastPathComponent)
    }
    
    var imageURL: URL? {
        guard let number = number else { return nil }
        return URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(number).png")
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
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
