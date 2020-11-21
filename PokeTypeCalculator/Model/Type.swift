//
//  Type.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/19/20.
//

import Foundation
import SwiftUI

enum Type: String, Decodable {
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
        switch self {
        case .bug:
            return PokeColor.bugType
        case .dark:
            return PokeColor.darkType
        case .dragon:
            return PokeColor.dragonType
        case .electric:
            return PokeColor.electricType
        case .fairy:
            return PokeColor.fairyType
        case .fighting:
            return PokeColor.fightingType
        case .fire:
            return PokeColor.fireType
        case .flying:
            return PokeColor.flyingType
        case .ghost:
            return PokeColor.ghostType
        case .grass:
            return PokeColor.grassType
        case .ground:
            return PokeColor.groundType
        case .ice:
            return PokeColor.iceType
        case .normal:
            return PokeColor.normalType
        case .poison:
            return PokeColor.poisonType
        case .psychic:
            return PokeColor.psychicType
        case .rock:
            return PokeColor.rockType
        case .steel:
            return PokeColor.steelType
        case .water:
            return PokeColor.waterType
        }
    }
    
}


extension Type: Identifiable {
    
    var id: String {
        self.rawValue
    }
    
}

