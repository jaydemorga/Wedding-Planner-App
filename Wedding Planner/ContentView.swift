//
//  ContentView.swift
//  Wedding Planner
//
//  Created by jayden morgan on 2/20/24.
//

import SwiftUI


struct ContentView: View {
@State private var goHome = true
    var body: some View {
        ZStack{
            if goHome{
                Home(goHome: $goHome)
            }
            else{
                openingPage(goHome: $goHome)
            }
            ToolBar(goHome: $goHome)
        }
    }
}

#Preview {
    ContentView()
}
