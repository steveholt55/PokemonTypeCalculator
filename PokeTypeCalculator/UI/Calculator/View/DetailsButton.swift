//
//  DetailsButton.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/17/21.
//

import SwiftUI

struct DetailsButton: View {
    
    @ObservedObject var viewModel: CalculatorViewModel
    
    let padding: CGFloat = 12
    let imageSize: CGFloat = 32
    var body: some View {
        
        Button(action: {
            self.viewModel.showDetailsSubject.send()
        }) {
            Text("View Details")
                .foregroundColor(.white)
                .font(.system(.title3))
                .fontWeight(.bold)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
        }
        .background(AppColors.red)
        .cornerRadius(8)
        
    }
}

struct DetailsButton_Previews: PreviewProvider {
    static var previews: some View {
        DetailsButton(viewModel: CalculatorViewModel())
            .previewLayout(.sizeThatFits)
    }
}
