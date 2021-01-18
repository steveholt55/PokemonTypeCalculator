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
}
