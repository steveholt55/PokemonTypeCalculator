//
//  TypeButtonView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/21/20.
//


import SwiftUI

struct TypeButtonView: View {
    
    @ObservedObject var type: TypeHolder
    
    var body: some View {
        if let type = type.type {
            TypeBadgeView(type: type)
        } else {
            HStack {
                Text("Select")
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                        .foregroundColor(Color(UIColor.secondaryLabel))
            }
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(4.0)
        }
    }
}

struct TypeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TypeButtonView(type: TypeHolder())
            TypeButtonView(type: TypeHolder.mockType)
        }
    }
}


