//
//  settings.swift
//  Wedding Planner
//
//  Created by jayden morgan on 2/20/24.
//

import SwiftUI

struct settings: View {
    
    
    @State private var showSettings = false
    @Binding var currentView: Int
    var body: some View {
        ZStack{
            if showSettings {
                ZStack{
                    GeometryReader { geometry in
                        Rectangle()
                            .fill(ColorPalette.blushPink)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                    }.edgesIgnoringSafeArea(.all)
                    VStack{
                        Button {
                            currentView = 1
                            showSettings = false
                        } label: {
                            Text("Names")
                        }
                        Button {
                            currentView = 3
                            showSettings = false
                        } label: {
                            Text("Colors")
                        }
                        Button {
                            currentView = 4
                            showSettings = false
                        } label: {
                            Text("Budget")
                        }
                        Button {
                            currentView = 5
                            showSettings = false
                        } label: {
                            Text("Rings")
                        }
                        Button {
                            if let bundle = Bundle.main.bundleIdentifier {
                                UserDefaults.standard.removePersistentDomain(forName: bundle)
                            }
                            UserDefaults.standard.synchronize()
                        } label: {
                            Text("Restart")
                        }

                    }
                }
            }
            VStack{
                HStack{
                    Button {
                        showSettings.toggle()
                    } label: {
                        Image(systemName: "line.horizontal.3")
                            .font(.system(size: 30))
                            .foregroundColor(ColorPalette.lightPeach)
                    }.padding(40)
                    Spacer()
                }
                .padding()
                Spacer()
            }
            
        }
    }
}

//Preview {
 //   #settings(currentView: $currentView)
 //   }
