//
//  rings.swift
//  Wedding Planner
//
//  Created by jayden morgan on 2/20/24.
//

import SwiftUI

struct rings: View {
    
    @State private var funds = (UserDefaults.standard.string(forKey: "savedBudget") ?? "0.0")
    @State private var herRing = ""
    @State private var hisRing = ""
    @State private var newTotal = 0.0
    var body: some View {
        ZStack{
            VStack{
                Text("Let's decide how much rings are going to cost!")
                    .textStyle()
                    .padding()
                Text("Budget Left: " + funds)
                    .textStyle()
                HStack{
                    TextField("Her ring cost", text: $herRing)
                        .padding(.horizontal)
                    TextField("His ring cost", text: $hisRing)
                }.padding()
                Button {
                    newTotal = (Double(funds) ?? 0.0) - ((Double(hisRing) ?? 0.0) + (Double(herRing) ?? 0.0))
                    UserDefaults.standard.set(newTotal, forKey: "savedBudget")
                    funds = (UserDefaults.standard.string(forKey: "savedBudget") ?? "0.0")
                } label: {
                    Text("Save")
                        .buttonStyle()
                }
            }
        }
    }
    private let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            formatter.timeStyle = .none
            return formatter
        }()
    
    private func saveDate(_ date: Date) {
            do {
                let encodedData = try JSONEncoder().encode(date)
                UserDefaults.standard.set(encodedData, forKey: "ringDueDate")
                print("Date saved successfully")
            } catch {
                print("Error saving date: \(error.localizedDescription)")
            }
        }
}




#Preview {
    rings()
}
