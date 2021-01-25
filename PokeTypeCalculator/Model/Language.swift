//
//  Language.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/22/21.
//

import Foundation

struct Language: Codable {
    
    var locale: Locale {
        Locale(identifier: self.name)
    }
    
    let name: String
    let url: URL
}

