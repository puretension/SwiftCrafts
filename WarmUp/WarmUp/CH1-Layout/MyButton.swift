//
//  MyButton.swift
//  WarmUp
//
//  Created by 이도형 on 1/13/24.
//

import SwiftUI

struct MyButton: View {
    var buttonTitle: String? = "Button X"
    var buttonColor: Color? = .black
    
    var body: some View {
        Button(buttonTitle!){}
            .padding() // Useful
            .background(buttonColor)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

#Preview {
    MyButton(buttonTitle: "Button X", buttonColor: .black)
}
