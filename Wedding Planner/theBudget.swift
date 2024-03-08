//
//  budget.swift
//  Wedding Planner
//
//  Created by jayden morgan on 2/20/24.
//

import SwiftUI

struct TheBudget: View {
    @State var budget : String = (UserDefaults.standard.string(forKey: "savedBudget") ?? "0.0")
    
    var body: some View {
        ZStack{
            VStack{
                Text("What is your target budget?")
                    .textStyle()
                TextField("Money", text: $budget)
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
    budget()
}
