//
//  SelectedPokemonView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/23/20.
//

import SwiftUI

struct SelectedPokemonView: View {
    
    @ObservedObject var viewModel: CalculatorViewModel
    
    var body: some View {
        
        if let selectedName = viewModel.pokemon?.name {
            ZStack {
                if let primaryType = viewModel.primaryType.type {
                    ZStack {
                        GeometryReader { reader in
                            let radius = max(reader.size.width, reader.size.height)
                            
                            ZStack {
                                
                                primaryType.color
                                    .frame(width: radius, height: radius)
                                    .cornerRadius(radius / 2.0)
                                    .shadow(radius: 1)
                                    .offset(y: -radius / 2)
                                
                                if let secondaryType = viewModel.secondaryType.type {
                                    Path { path in
                                        let width = radius
                                        let height = radius
                                        
                                        path.addArc(center: CGPoint(x: height / 2, y: 0), radius: height / 2, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 270
                                        ), clockwise: true)
                                        
                                        path.closeSubpath()
                                    }
                                    .foregroundColor(secondaryType.color)
                                }
                                
                            }
                        }
                        .frame(height: 200)
                        
                        Text(selectedName.capitalized)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .padding(EdgeInsets(top: 16, leading: 4, bottom: 16, trailing: 4))
                    }
                    
                }
            }
        } else {
            LoadingView()
        }
    }
}

struct SelectedPokemonView_Previews: PreviewProvider {
    static var previews: some View {
        let loadingViewModel = CalculatorViewModel()
        let dataViewModel = CalculatorViewModel()
        dataViewModel.pokemon = PokemonHolder.mock().pokemon
        dataViewModel.primaryType = TypeHolder.mockType
        
        return Group {
            SelectedPokemonView(viewModel: loadingViewModel)
                .previewLayout(.fixed(width: 320, height: 320))
            SelectedPokemonView(viewModel: dataViewModel)
                .previewLayout(.sizeThatFits)
        }
    }
}
