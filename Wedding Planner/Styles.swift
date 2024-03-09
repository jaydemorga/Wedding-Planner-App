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
            .shadow(color: ColorPalette.gold , radius: 8, x: -9, y: -9)
            .shadow(color: ColorPalette.blushPink , radius: 8, x: 9, y: 9)
            .padding(20)
            .foregroundColor(ColorPalette.blushPink)
            .cornerRadius(20)
            .shadow(color: ColorPalette.gold , radius: 10, x: -9, y: -9)
            .shadow(color: ColorPalette.blushPink , radius: 10, x: 9, y: 9)
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
            .font(Font.custom("Parisienne-Regular", size: 40))
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
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

struct ColorPalette {
    static var globalRed = 203.0
    static var globalGreen = 195.0
    static var globalBlue = 245.0
    //static var globalVarColor =  (Color(red: Double(globalRed/255), green: Double(globalGreen/255), blue: Double(globalBlue/255)))
    static var mainColor = UserDefaults.standard.object(forKey: "mainColor") as? Color ?? (Color(red: Double(globalRed/255), green: Double(globalGreen/255), blue: Double(globalBlue/255)))
    //static var lighterColor = globalVarColor
    static var lightPeach = Color(hex: "#FFDAB9")
    static var blushPink = Color(hex: "#FFE4E1")
    static var ivory = Color(hex: "#FFFFF0")
    static var gold = Color(hex: "#FFD700")
}

extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical, 10)
            .padding(.horizontal, 15)
            .background(ColorPalette.ivory)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            .foregroundColor(.black)
    }
}

extension AnyTransition {
    static var backslide: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .leading))}
}
