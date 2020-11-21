//
//  DamageRelation.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/21/20.
//

import Foundation

struct DamageRelation {
    let immune: Set<Type>
    let resistant: Set<Type>
    let weak: Set<Type>
    var normal: Set<Type> {
        let allTypes: Set<Type> = Set(Type.allCases)
        let normal: Set<Type> = allTypes.subtracting(immune.union(resistant).union(weak))
        return normal
    }
    
    var sections: [TypeSection] {
        var result: [TypeSection] = []
        
        if immune.count > 0 {
            result.append(TypeSection(name: "Immune", types: Array(immune).sorted { $0.rawValue < $1.rawValue }))
        }
        
        if resistant.count > 0 {
            result.append(TypeSection(name: "Resistant", types: Array(resistant).sorted { $0.rawValue < $1.rawValue }))
        }
        
        if weak.count > 0 {
            result.append(TypeSection(name: "Weak", types: Array(weak).sorted { $0.rawValue < $1.rawValue }))
        }
        
        if normal.count > 0 {
            result.append(TypeSection(name: "Normal", types: Array(normal).sorted { $0.rawValue < $1.rawValue }))
        }
        
        return result
    }
}
