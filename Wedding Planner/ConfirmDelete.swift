//
//  ConfirmDelete.swift
//  Wedding Planner
//
//  Created by jayden morgan on 2/26/24.
//

import SwiftUI

struct ConfirmDelete: View {
    @Binding var showView: Bool
    @Binding var items: [String]
    @Binding var item: Int
    @Binding var isCompleteList: [Bool]
    let isCompleteKey: String
    let key : String
    
    var body: some View {
        ZStack{
            GeometryReader { geometry in
                Rectangle()
                    .fill(ColorPalette.blushPink)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }.edgesIgnoringSafeArea(.all)
            RoundedRectangle(cornerRadius: 25)
                .fill(ColorPalette.ivory)
                .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.25)
            VStack{
                Text("Are you sure you want to delete this?")
                    .textStyle()
                HStack{
                    Button {
                        showView = false
                    } label: {
                        Text("Cancel")
                            .buttonStyle()
                    }
                    Button {
                        isCompleteList.remove(at: item)
                        addIsCompleteDefault(isCompleteList)
                        items.remove(at: item)
                        addDefault(items, key)
                        showView = false
                    } label: {
                        Text("Delete")
                            .buttonStyle()
                    }
                }
            }
        }
    }
    func addDefault(_ items: [String], _ key: String){
        UserDefaults.standard.set(items, forKey: key)
        UserDefaults.standard.synchronize()
    }
    func addIsCompleteDefault(_ items: [Bool]){
        UserDefaults.standard.set(items, forKey: isCompleteKey)
        UserDefaults.standard.synchronize()
    }
}

