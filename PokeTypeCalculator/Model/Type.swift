//
//  Type.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/19/20.
//

import Foundation
import SwiftUI

class TypeHolder: ObservableObject {
    @Published var type: Type? = nil
    
    static var mockType: TypeHolder = {
        let holder = TypeHolder()
        holder.type = .grass
        return holder
    }()
}

enum Type: String, CaseIterable {
    case bug
    case dark
    case dragon
    case electric
    case fairy
    case fighting
    case fire
    case flying
    case ghost
    case grass
    case ground
    case ice
    case normal
    case poison
    case psychic
    case rock
    case steel
    case water
    
    // MARK: - Color
    
    var color: Color {
        let hexString: String
        switch self {
        case .bug:
            hexString = "A8B820"
        case .dark:
            hexString = "705746"
        case .dragon:
            hexString = "6F35FC"
        case .electric:
            hexString = "F7D02C"
        case .fairy:
            hexString = "D685AD"
        case .fighting:
            hexString = "C22E28"
        case .fire:
            hexString = "EE8130"
        case .flying:
            hexString = "A98FF3"
        case .ghost:
            hexString = "735797"
        case .grass:
            hexString = "7AC74C"
        case .ground:
            hexString = "E2BF65"
        case .ice:
            hexString = "96D9D6"
        case .normal:
            hexString = "A8A77A"
        case .poison:
            hexString = "A33EA1"
        case .psychic:
            hexString = "F95587"
        case .rock:
            hexString = "B6A136"
        case .steel:
            hexString = "B7B7CE"
        case .water:
            hexString = "6390F0"
        }
        
        guard let uicolor = UIColor(hexString: "#\(hexString)") else {
            fatalError("Bad Hex Color")
        }
        return Color(uicolor)
    }
    
}


extension Type: Identifiable {
    
    var id: String {
        self.rawValue
    }
    
}


