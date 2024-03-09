//
//  ToolBar.swift
//  Wedding Planner
//
//  Created by jayden morgan on 3/8/24.
//

import SwiftUI

struct ToolBar: View {
    @Binding var goHome: Bool
    var body: some View {
        GeometryReader { geometry in
            VStack{
                Spacer()
                ZStack{
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(ColorPalette.ivory)
                        .frame(width: geometry.size.width, height: geometry.size.height * 1.5 / 10)
                        .shadow(radius: 10)
                        .ignoresSafeArea(.all)
                    HStack{
                        Button {
                            goHome = false
                        } label: {
                            ZStack{
                                Circle()
                                    .fill(.black)
                                    .frame(width: 45)
                                Image(systemName: "arrow.up.backward.and.arrow.down.forward.circle.fill")
                                    .font(.system(size:50))
                                    .padding()
                                    .foregroundColor(ColorPalette.lightPeach)
                                    .shadow(radius: 10)
                            }
                        }
                        Button {
                            goHome = true
                        } label: {
                            ZStack{
                                Circle()
                                    .fill(.black)
                                    .frame(width: 45)
                                Image(systemName: "house.circle.fill")
                                    .font(.system(size:50))
                                    .padding()
                                    .foregroundColor(ColorPalette.lightPeach)
                                    .shadow(radius: 10)
                            }
                        }
                        Button {
                            goHome = false
                        } label: {
                            ZStack{
                                Circle()
                                    .fill(.black)
                                    .frame(width: 45)
                                Image(systemName: "arrowshape.right.circle.fill")
                                    .font(.system(size:50))
                                    .padding()
                                    .foregroundColor(ColorPalette.lightPeach)
                                    .shadow(radius: 10)
                            }
                        }
                        
                    }.padding(.bottom,30)
                }
            }.ignoresSafeArea(.all)
        }
    }
}

#Preview {
    ToolBar(goHome: .constant(true))
}
