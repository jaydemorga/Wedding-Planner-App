//
//  nameView.swift
//  Wedding Planner
//
//  Created by jayden morgan on 2/20/24.
//

import SwiftUI

struct nameView: View {
    @State private var womanName: String = UserDefaults.standard.string(forKey: "savedWomanName") ?? ""
    @State private var manName: String = UserDefaults.standard.string(forKey: "savedManName") ?? ""
    @State private var newLastName: String = UserDefaults.standard.string(forKey: "savedNewLastName") ?? ""
    @State private var isClicked = false
    @State private var isClicked2 = false
    @State private var isClicked3 = false
    
    var body: some View {
        ZStack{
            VStack{
                Text("Who is getting married?")
                    .textStyle()
                TextField("Ladies First Name", text: $womanName)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(isClicked ? ColorPalette.gold: Color.clear, lineWidth: 2)
                    )
                    .textFieldStyle(CustomTextFieldStyle())
                    .onTapGesture {
                        isClicked = true
                        isClicked2 = false
                        isClicked3 = false
                    }
                TextField("Gentleman's First Name" , text: $manName)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(isClicked2 ? ColorPalette.gold: Color.clear, lineWidth: 2)
                    )
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding(.vertical)
                    .onTapGesture {
                        isClicked = false
                        isClicked2 = true
                        isClicked3 = false
                    }
                TextField("The New Last Name" , text: $newLastName)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(isClicked3 ? ColorPalette.gold: Color.clear, lineWidth: 2)
                    )
             
                    .textFieldStyle(CustomTextFieldStyle())
                    .onTapGesture {
                        isClicked = false
                        isClicked2 = false
                        isClicked3 = true
                    }
                ZStack{
                    Image(systemName: "heart")
                        .font(.system(size: 200))
                        .foregroundColor(ColorPalette.ivory)
                    VStack{
                        Text(womanName + " " + newLastName)
                            .textStyle()
                        Image(systemName: "plus")
                            .foregroundColor(ColorPalette.ivory)
                        Text(manName + " " + newLastName)
                            .textStyle()
                    }
                }
                Button(action: {
                    UserDefaults.standard.set(womanName, forKey: "savedWomanName")
                    UserDefaults.standard.set(manName, forKey: "savedManName")
                    UserDefaults.standard.set(newLastName, forKey: "savedNewLastName")
                }, label: {
                    Text("Save")
                        //.buttonStyle()
                })
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    nameView()
}
