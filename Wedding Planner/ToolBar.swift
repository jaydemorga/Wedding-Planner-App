//
//  ToolBar.swift
//  Wedding Planner
//
//  Created by jayden morgan on 3/8/24.
//

import SwiftUI

struct ToolBar: View {
    @State private var goHome = false
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25.0)
                .fill(ColorPalette.ivory)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
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
    }
}

#Preview {
    ToolBar()
}
