//
//  StatRowView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/19/21.
//

import SwiftUI

struct StatRowView: View {
    
    let stat: Stat
    @State var primaryColor: Color = .primaryRed
    
    var statPercentValue: CGFloat {
        CGFloat(stat.baseStat) / CGFloat(stat.name.maxValue())
    }
    
    var statColor: Color {
        statPercentValue <= 0.10 ? .black : .white
    }
    
    var body: some View {
        
        HStack {
            
            Text("\(stat.name.rawValue.capitalized):")
                .font(.title2)
                .lineLimit(1)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
            
            GeometryReader { metrics in
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
                    
                    Color(UIColor.secondarySystemBackground)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color(UIColor.secondarySystemBackground), lineWidth: 2)
                        )
                        
                    self.primaryColor.frame(width: metrics.size.width * self.statPercentValue, alignment: .trailing)
                        .cornerRadius(12)
                })
            }
            
            Text("\(stat.baseStat)")
                .frame(minWidth: 0, maxWidth: 30)
                .foregroundColor(Color(.label))
                .font(.caption)
            
        }
    }
}

struct StatRowView_Previews: PreviewProvider {
    static var previews: some View {
        StatRowView(stat: Stat.mock())
    }
}
