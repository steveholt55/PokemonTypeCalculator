//
//  BioItem.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/19/21.
//

import Foundation

struct BioItem: Identifiable {
    
    enum BioItemName: String, Codable {
        case number = "Number"
        case height = "Height"
        case weight = "Weight"
        case baseExperience = "Base Experience"
    }
    
    // Identifiable
    var id: String { name.rawValue }
    
    let name: BioItemName
    let value: String
}
