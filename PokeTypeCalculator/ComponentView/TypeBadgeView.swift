//
//  TypeBadgeView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/19/20.
//

import SwiftUI

struct TypeBadgeView: View {
    
    let type: Type
    
    var body: some View {
        
        HStack {
            
            Circle()
                .frame(maxWidth: 34, maxHeight: 34)
                .foregroundColor(type.color)
            
            Text(type.rawValue.capitalized)
                    .font(.body)
        }
        .padding(.horizontal, 8.0)
    }
}

struct TypeBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        let type: Type = .grass
        TypeBadgeView(type: type)
    }
}

