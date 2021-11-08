//
//  ButtonModifier.swift
//  StateAndDataFlow
//
//  Created by iMac on 08.11.2021.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .frame(width: 200, height: 60)
            .background(color)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color.black, lineWidth: 4)
            )
    }
}

extension View {
    // buttonAppearancе - название модификатора
    func buttonAppearance(_ color: Color) -> some View {
        ModifiedContent(
            content: self,
            modifier: ButtonModifier(color: color)
        )
    }
}
