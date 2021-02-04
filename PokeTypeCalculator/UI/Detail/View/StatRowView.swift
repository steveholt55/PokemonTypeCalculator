//
//  StatRowView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/19/21.
//

import SwiftUI

struct StatRowView: View {
    
    let stat: Stat
    @State var primaryColor: Color = AppColors.red
    
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
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            GeometryReader { metrics in
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
                    
                    Color(UIColor.secondarySystemBackground)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .border(Color(UIColor.secondarySystemBackground), width: 1)
                        
                    self.primaryColor.frame(width: metrics.size.width * self.statPercentValue, alignment: .trailing)
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
