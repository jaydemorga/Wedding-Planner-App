//
//  Home.swift
//  Wedding Planner
//
//  Created by jayden morgan on 3/4/24.
//

import SwiftUI

struct Home: View {
    @State private var weddingDaysDifference = UserDefaults.standard.integer(forKey: "daysUntilWedding")
    @Binding var goHome: Bool
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                ColorPalette.blushPink.ignoresSafeArea()
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(ColorPalette.ivory)
                            .shadow(radius: 10)
                            .ignoresSafeArea()
                        Rectangle()
                            .fill(ColorPalette.lightPeach.gradient)
                            .ignoresSafeArea()
                            .clipShape(Circle())
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .padding()
                        VStack{
                            Text("\(weddingDaysDifference)")
                                .font(Font.custom("Parisienne-Regular", size: 75))
                                
                            Text("Days Left")
                                .font(.title2)
                        }
                        
                    }.frame(width: geometry.size.width, height: geometry.size.height * 3 / 10)
                    
                    ScrollView{
                        VStack{
                            Button {
                                
                            } label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(ColorPalette.lightPeach.gradient)
                                        .frame(width: 300, height: 80)
                                    
                                    Text("To Do")
                                        .textStyle()
                                }
                            }
                            .shadow(radius: 10)
                            .padding()
                            Button {
                                
                            } label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(ColorPalette.lightPeach.gradient)
                                        .frame(width: 300, height: 80)
                                    Text("Step By Step")
                                        .textStyle()
                                }
                            }
                            .shadow(radius: 10)
                            .padding()
                            Button {
                                
                            } label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(ColorPalette.lightPeach.gradient)
                                        .frame(width: 300, height: 80)
                                    Text("Due Dates")
                                        .textStyle()
                                }
                            }
                            .shadow(radius: 10)
                            .padding()
                            Button {
                                
                            } label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(ColorPalette.lightPeach.gradient)
                                        .frame(width: 300, height: 80)
                                    Text("Venues")
                                        .textStyle()
                                }
                            }
                            .shadow(radius: 10)
                            .padding()
                        }
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 7 / 10)
                }
            }
        }
    }
}

#Preview {
    Home(goHome: .constant(true))
}
