//
//  ringsDueDate.swift
//  Wedding Planner
//
//  Created by jayden morgan on 2/27/24.
//

import SwiftUI

struct ringsDueDate: View {
    @State private var selectedDate = UserDefaults.standard.object(forKey: "ringDate") as? Date ?? Date()
    @State private var daysDifference = UserDefaults.standard.integer(forKey: "daysUntilRing")
    var body: some View {
        VStack{
            Text("What Day Will You Have The Rings By?")
                .textStyle()
            DateView(eventMessage: "You have the rings", eventKey: "ringDate", daysUntilKey: "daysUntilRing", selectedDate: $selectedDate, daysDifference: $daysDifference)
        }
    }
}

#Preview {
    ringsDueDate()
}
