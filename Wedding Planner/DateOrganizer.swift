//
//  DateOrganizer.swift
//  Wedding Planner
//
//  Created by jayden morgan on 2/27/24.
//

import SwiftUI

struct DateOrganizer: View {
    @State private var weddingSelectedDate = UserDefaults.standard.object(forKey: "weddingDate") as? Date ?? Date()
    @State private var weddingDaysDifference = UserDefaults.standard.integer(forKey: "daysUntilWedding")
    
    @State private var ringSelectedDate = UserDefaults.standard.object(forKey: "ringDate") as? Date ?? Date()
    @State private var ringDaysDifference = UserDefaults.standard.integer(forKey: "daysUntilRing")
    
    var body: some View {
        Text("Important Dates:")
            .textStyle()
        Spacer()
        Text("Days Until The Wedding: \(weddingDaysDifference)")
        Text("Wedding Date: \(weddingSelectedDate, formatter: dateFormatter)")
        Spacer()
        Text("Days Until Rings: \(ringDaysDifference)")
        Text("Rings Due Date: \(ringSelectedDate, formatter: dateFormatter)")
        Spacer()
    }
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }
}

#Preview {
    DateOrganizer()
}
