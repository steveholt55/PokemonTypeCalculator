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
            
            Rectangle()
                .frame(width: 24, height: 24)
                .foregroundColor(type.color)
                .shadow(radius: 1)
            
            Text(type.rawValue.capitalized)
                .font(.title3)
            
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

