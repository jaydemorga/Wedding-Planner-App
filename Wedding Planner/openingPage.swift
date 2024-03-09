//
//  openingPage.swift
//  Wedding Planner
//
//  Created by jayden morgan on 2/20/24.
//

import SwiftUI

struct openingPage: View {
    @State private var isShowing = false
    @Binding var goHome: Bool
    var body: some View {
        ZStack{
            ColorPalette.blushPink
            ZStack{
                VStack{
                    Spacer()
                    TabView{
                        Text("Welcome to Wedding Planner \nlets plan your wedding!")
                            .textStyle()
                            .padding()
                            .frame(width: 350, height: 300)
                            .background {
                                UnevenRoundedRectangle(cornerRadii: .init(
                                    topLeading: 50.0,
                                    bottomLeading: 10.0,
                                    bottomTrailing: 50.0,
                                    topTrailing: 30.0),
                                                       style: .continuous)
                                .foregroundStyle(ColorPalette.ivory)
                            }
                            .shadow(radius: 10)
                        
                        nameView()
                            
                        WeddingDate()
                           
                        Text("Feel free to change anything at anytime, this is your wedding after all :)")
                            .textStyle()
                           
                        colorPickerView()
                        
                        theBudget()
                            
                        rings()
                           
                        ringsDueDate()
                        
                        groom()
                        
                        bride()
                        
                        Venue()
                            
                        
                    }.tabViewStyle(.page)
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
}




#Preview {
    openingPage(goHome: .constant(false))
}
