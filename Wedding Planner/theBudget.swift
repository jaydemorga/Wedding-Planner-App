//
//  budget.swift
//  Wedding Planner
//
//  Created by jayden morgan on 2/20/24.
//

import SwiftUI

struct theBudget: View {
    @State private var budget : String = (UserDefaults.standard.string(forKey: "savedBudget") ?? "")
    
    var body: some View {
        ZStack{
            VStack{
                Text("What is your target budget?")
                    .textStyle()
                TextField("Enter Budget", text: $budget)
                    .padding()
                Button(action: {
                    UserDefaults.standard.set(budget, forKey: "savedBudget")
                }) {
                    Text("Save")
                        .buttonStyle()
                }
            }
        }
    }
}

#Preview {
    theBudget()
}
