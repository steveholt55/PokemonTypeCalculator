//
//  TypeSection.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/19/20.
//

import Foundation

struct TypeSection: Identifiable {
    var id: String {
        return name
    }
    let name: String
    let types: [Type]
}
