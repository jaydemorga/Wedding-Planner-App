//
//  colorPickerView.swift
//  Wedding Planner
//
//  Created by jayden morgan on 2/20/24.
//

import SwiftUI


struct colorPickerView: View {
    @Environment(\.self) var environment
    @State private var firstColor = Color(.sRGB, red: Double.random(in: 0..<1), green: Double.random(in: 0..<1), blue: Double.random(in: 0..<1))
    @State private var secondColor = Color(.sRGB, red: Double.random(in: 0..<1), green: Double.random(in: 0..<1), blue: Double.random(in: 0..<1))
    @State private var thirdColor = Color(.sRGB, red: Double.random(in: 0..<1), green: Double.random(in: 0..<1), blue: Double.random(in: 0..<1))
    @State private var components: Color.Resolved?

    var body: some View {
        
        VStack {
            Spacer()
            Text("Now lets pick some colors")
                .textStyle()
            Spacer()
            ColorPicker("Select your Main color", selection: $firstColor, supportsOpacity: false)
            ColorPicker("Select your Accent color", selection: $secondColor, supportsOpacity: false)
            ColorPicker("Select your second Accent color (Optional)", selection: $thirdColor, supportsOpacity: false)
            HStack{
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 50, height: 50)
                    .foregroundColor(firstColor)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                            )
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 50, height: 50)
                    .foregroundColor(secondColor)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                            )
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(thirdColor)
                    .frame(width: 50, height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                            )
                   
                    
            }
            Button(action: {
                //UserDefaults.standard.set(UIColor(firstColor), forKey: "mainColor")
                //firstColor = (UserDefaults.standard.color(forKey: "mainColor")
            }, label: {
                Text("Save")
                    .buttonStyle()
            })
            Spacer()
        }
        .padding()
        .onChange(of: firstColor, initial: true) { components = firstColor.resolve(in: environment) }
       
    }
    
}
extension UserDefaults {

    func color(forKey key: String) -> UIColor? {

        guard let colorData = data(forKey: key) else { return nil }

        do {
            return try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: colorData)
        } catch let error {
            print("color error \(error.localizedDescription)")
            return nil
        }

    }

    func set(_ value: UIColor?, forKey key: String) {

        guard let color = value else { return }
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false)
            set(data, forKey: key)
        } catch let error {
            print("error color key data not saved \(error.localizedDescription)")
        }

    }

}

#Preview {
    colorPickerView()
}
