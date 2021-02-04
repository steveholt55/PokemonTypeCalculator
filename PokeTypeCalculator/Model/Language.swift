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
    
    /// Check if Language is of user's Locale
    func isCurrentLocale() -> Bool {
        self.locale.languageCode == Locale.current.languageCode
    }
    
    /// Check if Language is of user's Locale or of the default Locale (en)
    func isCurrentLocaleOrDefault() -> Bool {
        self.isCurrentLocale() || self.locale.languageCode == Locale(identifier: "us").languageCode
    }
}

extension Language {
    static func mock() -> Language {
        Language(name: "en", url: URL(string:"https://pokeapi.co/api/v2/language/1/")!)
    }
}
