//
//  FormRowView.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/19/21.
//

import SwiftUI

struct FormRowView: View {
    
    let form: Form
    
    var body: some View {
        Text(form.name.capitalized)
            .font(.title2)
    }
}

struct FormRowView_Previews: PreviewProvider {
    static var previews: some View {
        FormRowView(form: Form.mock())
    }
}
