//
//  Venue.swift
//  Wedding Planner
//
//  Created by jayden morgan on 2/29/24.
//

import SwiftUI

struct Venue: View {
    @State private var remainingFunds = (UserDefaults.standard.string(forKey: "savedBudget") ?? "")
    @State private var newCost = ""
    @State private var newTotal = 0.0
    @State private var counter = 3
    @State private var guestNumber = ""
    var body: some View {
        ZStack{
            GeometryReader { geometry in
                Rectangle()
                    .fill(ColorPalette.blushPink)
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }.edgesIgnoringSafeArea(.all)
            VStack{
                
                if counter == 0{
                    VStack{
                        Text("Now lets pick a venue")
                            .textStyle()
                        Text("Lets go step by step")
                            .textStyle()
                    }
                }
                if counter == 1{
                    TextField("Estimated Costs for venue: ", text: $newCost)
                        .padding()
                    Text("Total Remaining Funds: \(remainingFunds)")
                    Button {
                        newTotal = (Double(remainingFunds) ?? 0.0) - (Double(newCost) ?? 0.0)
                        UserDefaults.standard.set(newTotal, forKey: "savedBudget")
                        remainingFunds = (UserDefaults.standard.string(forKey: "savedBudget") ?? "0.0")
                    } label: {
                        Text("Save")
                            .buttonStyle()
                    }
                }
                if counter == 2{
                    Text("How many guests are you planning on?")
                        .textStyle()
                    TextField("Estamated number of guests", text: $guestNumber)
                }
                if counter == 3{
                    Text("Now lets record a few options")
                        .textStyle()
                    VenueOption(venueList: ["Venue Name 2", "1200", "3500"], venueCheckListKey: "venue2")
                    VenueOption(venueList: ["Venue Name", "200", "2000"], venueCheckListKey: "venue1")
                }
                
                HStack{
                    if counter > 0 {
                        Button(action: {
                            withAnimation{
                                if counter > 0{
                                    counter -= 1
                                }
                            }
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            
                        }){
                            Image(systemName: "arrow.left")
                                .buttonStyle()
                        }
                    }
                    Button(action: {
                        withAnimation{
                            counter += 1
                        }
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }){
                        Image(systemName: "arrow.right")
                            .buttonStyle()
                    }
                }
                .padding(.bottom)
            }
        }
    }
}



#Preview {
    Venue()
}
