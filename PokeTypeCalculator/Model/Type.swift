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
    
    var damageRelation: DamageRelation {
        switch self {
        case .bug:
            return self.bugDamageRelation()
        case .dark:
            return self.darkDamageRelation()
        case .dragon:
            return self.dragonDamageRelation()
        case .electric:
            return self.electricDamageRelation()
        case .fairy:
            return self.fairyDamageRelation()
        case .fighting:
            return self.fightingDamageRelation()
        case .fire:
            return self.fireDamageRelation()
        case .flying:
            return self.flyingDamageRelation()
        case .ghost:
            return self.ghostDamageRelation()
        case .grass:
            return self.grassDamageRelation()
        case .ground:
            return self.groundDamageRelation()
        case .ice:
            return self.iceDamageRelation()
        case .normal:
            return self.normalDamageRelation()
        case .poison:
            return self.poisonDamageRelation()
        case .psychic:
            return self.psychicDamageRelation()
        case .rock:
            return self.rockDamageRelation()
        case .steel:
            return self.steelDamageRelation()
        case .water:
            return self.waterDamageRelation()
        }
    }
    
}

extension Type {
    
    func bugDamageRelation() -> DamageRelation {
        
        let immune: Set<Type> = []
        let resistant: Set<Type> = [.fighting, .ground, .grass]
        let weak: Set<Type> = [.flying, .rock, .fire]
        
        return DamageRelation(immune: immune, resistant: resistant, weak: weak)
    }
    
    func darkDamageRelation() -> DamageRelation {
        
        let immune: Set<Type> = [.psychic]
        let resistant: Set<Type> = [.ghost, .dark]
        let weak: Set<Type> = [.fighting, .bug, .fairy]
        
        return DamageRelation(immune: immune, resistant: resistant, weak: weak)
    }
    
    func dragonDamageRelation() -> DamageRelation {
        
        let immune: Set<Type> = []
        let resistant: Set<Type> = [.fire, .water, .grass, .electric]
        let weak: Set<Type> = [.ice, .dragon, .fairy]
        
        return DamageRelation(immune: immune, resistant: resistant, weak: weak)
    }
    
    func electricDamageRelation() -> DamageRelation {
        
        let immune: Set<Type> = []
        let resistant: Set<Type> = [.flying, .steel, .electric]
        let weak: Set<Type> = [.ground]
        
        return DamageRelation(immune: immune, resistant: resistant, weak: weak)
    }
    
    func fairyDamageRelation() -> DamageRelation {
        
        let immune: Set<Type> = [.dragon]
        let resistant: Set<Type> = [.fighting, .bug, .dark]
        let weak: Set<Type> = [.poison, .steel]
        
        return DamageRelation(immune: immune, resistant: resistant, weak: weak)
    }

    func fightingDamageRelation() -> DamageRelation {
        
        let immune: Set<Type> = []
        let resistant: Set<Type> = [.rock, .bug, .dark]
        let weak: Set<Type> = [.flying, .psychic, .fairy]
        
        return DamageRelation(immune: immune, resistant: resistant, weak: weak)
    }
    
    func fireDamageRelation() -> DamageRelation {
        
        let immune: Set<Type> = []
        let resistant: Set<Type> = [.bug, .steel, .fire, .grass, .ice, .fairy]
        let weak: Set<Type> = [.ground, .rock, .water]
        
        return DamageRelation(immune: immune, resistant: resistant, weak: weak)
    }
    
    func flyingDamageRelation() -> DamageRelation {
        
        let immune: Set<Type> = [.ground]
        let resistant: Set<Type> = [.fighting, .bug,. grass]
        let weak: Set<Type> = [.rock, .electric, .ice]
        
        return DamageRelation(immune: immune, resistant: resistant, weak: weak)
    }
    
    func ghostDamageRelation() -> DamageRelation {
        
        let immune: Set<Type> = [.normal, .fighting]
        let resistant: Set<Type> = [.poison, .bug]
        let weak: Set<Type> = [.ghost, .dark]
        
        return DamageRelation(immune: immune, resistant: resistant, weak: weak)
    }

    func grassDamageRelation() -> DamageRelation {
        
        let immune: Set<Type> = []
        let resistant: Set<Type> = [.ground, .water, .grass, .electric]
        let weak: Set<Type> = [.flying, .poison, .bug, .fire, .ice]
        
        return DamageRelation(immune: immune, resistant: resistant, weak: weak)
    }
    
    func groundDamageRelation() -> DamageRelation {
        
        let immune: Set<Type> = [.electric]
        let resistant: Set<Type> = [.poison, .rock]
        let weak: Set<Type> = [.water, .grass, .ice]
        
        return DamageRelation(immune: immune, resistant: resistant, weak: weak)
    }
    
    func iceDamageRelation() -> DamageRelation {
        
        let immune: Set<Type> = []
        let resistant: Set<Type> = [.ice]
        let weak: Set<Type> = [.fighting, .rock, .steel, .fire]
        
        return DamageRelation(immune: immune, resistant: resistant, weak: weak)
    }

    func normalDamageRelation() -> DamageRelation {
        
        let immune: Set<Type> = [.ghost]
        let resistant: Set<Type> = []
        let weak: Set<Type> = [.fighting]
        
        return DamageRelation(immune: immune, resistant: resistant, weak: weak)
    }
    
    func poisonDamageRelation() -> DamageRelation {
        
        let immune: Set<Type> = []
        let resistant: Set<Type> = [.fighting, .psychic]
        let weak: Set<Type> = [.bug, .ghost, .dark]
        
        return DamageRelation(immune: immune, resistant: resistant, weak: weak)
    }
    
    func psychicDamageRelation() -> DamageRelation {
        
        let immune: Set<Type> = []
        let resistant: Set<Type> = [.fighting, .psychic]
        let weak: Set<Type> = [.bug, .ghost, .dark]
        
        return DamageRelation(immune: immune, resistant: resistant, weak: weak)
    }
    
    func rockDamageRelation() -> DamageRelation {
        
        let immune: Set<Type> = []
        let resistant: Set<Type> = [.normal, .flying, .poison, .fire]
        let weak: Set<Type> = [.fighting, .ground, .steel, .water, .grass]
        
        return DamageRelation(immune: immune, resistant: resistant, weak: weak)
    }
    
    
    func steelDamageRelation() -> DamageRelation {
        
        let immune: Set<Type> = [.poison]
        let resistant: Set<Type> = [.normal, .flying, .rock, .bug, .steel, .grass, .psychic, .ice, .dragon, .fairy]
        let weak: Set<Type> = [.fire, .fighting, .ground]
        
        return DamageRelation(immune: immune, resistant: resistant, weak: weak)
    }
    
    func waterDamageRelation() -> DamageRelation {
        
        let immune: Set<Type> = []
        let resistant: Set<Type> = [.steel, .fire, .water, .ice]
        let weak: Set<Type> = [.grass, .electric]
        
        return DamageRelation(immune: immune, resistant: resistant, weak: weak)
    }
}


extension Type: Identifiable {
    
    var id: String {
        self.rawValue
    }
    
}


