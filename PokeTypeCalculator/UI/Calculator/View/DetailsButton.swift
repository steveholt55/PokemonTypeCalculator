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
            self.viewModel.showDetailsSubject.send(true)
        }) {
            HStack {
                Image(systemName: "info.circle")
                    .font(.system(.title))
                    .foregroundColor(AppColors.red)
                
                Text("Details")
                    .foregroundColor(Color(.label))
                    .font(.system(.title3))
                    .fontWeight(.bold)
            }
        }
    }
}

struct DetailsButton_Previews: PreviewProvider {
    static var previews: some View {
        DetailsButton(viewModel: CalculatorViewModel())
    }
}
