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
            Text(type.rawValue.uppercased())
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                    .foregroundColor(.white)
        }
        .background(type.color)
        .cornerRadius(4.0)

    }
}

struct TypeBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        let type: Type = .grass
        TypeBadgeView(type: type)
    }
}

