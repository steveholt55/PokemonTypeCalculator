//
//  DamageRelationCalculation.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/21/20.
//

import Foundation

struct DamageRelationCalculation {

    let primaryType: DamageRelation
    let secondaryType: DamageRelation?
    
    let immune: Set<Type>
    let resistant: Set<Type>
    let superResistant: Set<Type>
    let weak: Set<Type>
    let superWeak: Set<Type>
    
    var normal: Set<Type> {
        let allTypes: Set<Type> = Set(Type.allCases)
        let normal: Set<Type> = allTypes.subtracting(immune.union(resistant).union(weak).union(superWeak).union(superResistant))
        return normal
    }
    
    var sections: [TypeSection] {
        var result: [TypeSection] = []
        
        if superWeak.count > 0 {
            result.append(TypeSection(name: "Takes 4x From", types: Array(superWeak).sorted { $0.rawValue < $1.rawValue }))
        }
        
        if weak.count > 0 {
            result.append(TypeSection(name: "Takes 2x From", types: Array(weak).sorted { $0.rawValue < $1.rawValue }))
        }
        
        if normal.count > 0 {
            result.append(TypeSection(name: "Takes 1x From", types: Array(normal).sorted { $0.rawValue < $1.rawValue }))
        }
        
        if resistant.count > 0 {
            result.append(TypeSection(name: "Takes 1/2x From", types: Array(resistant).sorted { $0.rawValue < $1.rawValue }))
        }
        
        if superResistant.count > 0 {
            result.append(TypeSection(name: "Takes 1/4x From", types: Array(superResistant).sorted { $0.rawValue < $1.rawValue }))
        }
        
        
        if immune.count > 0 {
            result.append(TypeSection(name: "Takes 0x From", types: Array(immune).sorted { $0.rawValue < $1.rawValue }))
        }
        
        return result
    }
    
    
    init(primaryType: DamageRelation, secondaryType: DamageRelation?) {
        self.primaryType = primaryType
        self.secondaryType = secondaryType
        
        var result: [Type: Int] = Type.allCases.reduce(into: [Type: Int]()) {
            $0[$1] = 0
        }
        
        for type in Array(primaryType.immune) + Array(secondaryType?.immune ?? []) {
            result[type] = result[type]! - 500
        }
        
        for type in Array(primaryType.weak) + Array(secondaryType?.weak ?? []) {
            result[type] = result[type]! + 100
        }
        
        for type in Array(primaryType.resistant) + Array(secondaryType?.resistant ?? []) {
            result[type] = result[type]! - 100
        }
        
        immune = Set(result.filter {
            $0.value == -500
        }.map {
            $0.key
        })
        
        weak = Set(result.filter {
            $0.value == 100
        }.map {
            $0.key
        })
        
        superWeak = Set(result.filter {
            $0.value == 200
        }.map {
            $0.key
        })
        
        resistant = Set(result.filter {
            $0.value == -100
        }.map {
            $0.key
        })
        
        superResistant = Set(result.filter {
            $0.value == -200
        }.map {
            $0.key
        })
    }
}
