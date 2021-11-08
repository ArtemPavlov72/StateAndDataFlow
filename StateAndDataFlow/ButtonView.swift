//
//  ButtonView.swift
//  StateAndDataFlow
//
//  Created by iMac on 08.11.2021.
//

import SwiftUI

struct ButtonView: View {
    
    let title: String //название кнопки
    let color: Color //цвет кнопки
    let action: () -> Void //действие кнопки
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .buttonAppearance(color) //вызываем кастомный модификатор (он в отдельном файле)
    }
}

struct ActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Some Action", color: .red, action: {})
    }
}
