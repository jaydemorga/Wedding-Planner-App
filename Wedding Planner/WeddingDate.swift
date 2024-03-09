//
//  WeddingDate.swift
//  Wedding Planner
//
//  Created by jayden morgan on 2/27/24.
//

import SwiftUI

struct WeddingDate: View {
    @State private var daysUntilWedding = 0
    @State private var selectedDate = UserDefaults.standard.object(forKey: "weddingDate") as? Date ?? Date()
    @State private var daysDifference = UserDefaults.standard.integer(forKey: "daysUntilWedding")
    var body: some View {
        VStack{
            Text("When is the Wedding?")
                .textStyle()
            DateView(eventMessage: "Wedding", eventKey: "weddingDate", daysUntilKey: "daysUntilWedding", selectedDate: $selectedDate, daysDifference: $daysDifference)
        }
    }
}

#Preview {
    WeddingDate()
}
