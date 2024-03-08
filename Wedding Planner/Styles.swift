//
//  buttonStyles.swift
//  Wedding Planner
//
//  Created by jayden morgan on 2/20/24.
//

import SwiftUI

struct ButtonStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color.gray)
            .frame(width: 130, height: 20)
            .shadow(color: ColorPalette.lighterColor, radius: 8, x: -9, y: -9)
            .shadow(color: ColorPalette.globalVarColor, radius: 8, x: 9, y: 9)
            .padding(20)
            .foregroundColor(ColorPalette.globalVarColor)
            .background(ColorPalette.globalVarColor)
            .cornerRadius(20)
            .shadow(color: ColorPalette.lighterColor, radius: 10, x: -9, y: -9)
            .shadow(color: ColorPalette.globalVarColor, radius: 10, x: 9, y: 9)
    }
}

extension View {
    func buttonStyle() -> some View {
        self.modifier(ButtonStyleModifier())
    }
}

struct TextStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Chalkduster", size: 24))
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .transition(AnyTransition.asymmetric(insertion: .slide, removal: .scale))
    }
}

extension View {
    func textStyle() -> some View {
        self.modifier(TextStyleModifier())
    }
}

struct SmallTextStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Chalkduster", size: 16))
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .transition(AnyTransition.asymmetric(insertion: .slide, removal: .scale))
    }
}

extension View {
    func smallTextStyle() -> some View {
        self.modifier(SmallTextStyleModifier())
    }
}
