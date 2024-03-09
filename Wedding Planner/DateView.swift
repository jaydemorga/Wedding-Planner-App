//
//  DateView.swift
//  Wedding Planner
//
//  Created by jayden morgan on 2/27/24.
//

import SwiftUI

struct DateView: View {
    let eventMessage: String
    let eventKey: String
    let daysUntilKey: String

    @Binding var selectedDate: Date
    @Binding var daysDifference: Int

        var body: some View {
            VStack {
                LazyVStack{
                    DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .labelsHidden()
                    
                    Text("Selected Date: \(selectedDate, formatter: dateFormatter)")
                        .padding()
                    
                    Text("Days Until \(eventMessage): \(daysDifference)")
                        .padding()
                }
            }
            .onChange(of: selectedDate) {
                UserDefaults.standard.set(selectedDate, forKey: eventKey)
                updateDaysDifference()
            }
            .onAppear {
                updateDaysDifference()
            }
            .onReceive(Timer.publish(every: 86400, on: .current, in: .common).autoconnect()) { _ in
                updateDaysDifference()
            }
            
        }

        private var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            formatter.timeStyle = .none
            return formatter
        }
        private func updateDaysDifference() {
                let currentDate = Date()
                let calendar = Calendar.current
                let components = calendar.dateComponents([.day], from: currentDate, to: selectedDate)
                daysDifference = components.day ?? 0
                UserDefaults.standard.setValue(daysDifference, forKey: daysUntilKey)
            }
    }


//#Preview {
  //  DateView(eventMessage: "Wedding", eventKey: "", daysUntilKey: "")
//}
