//
//  openingPage.swift
//  Wedding Planner
//
//  Created by jayden morgan on 2/20/24.
//

import SwiftUI

struct openingPage: View {
    var body: some View {
        Button(action: {
            print("I was pressed")
        }){
            Text("press me")
        }
    }
}

#Preview {
    openingPage()
}
