//
//  VenueOption.swift
//  Wedding Planner
//
//  Created by jayden morgan on 2/29/24.
//

import SwiftUI

struct venueItem: Identifiable, Codable{
    var id = UUID()
    var name: String
    var isComplete: Bool
    var image: String
    
}

struct VenueOption: View {
    @State private var showExpandedView = false
    var venueList: [String]
    
    @State private var venueCheckList = [
        venueItem(name: "Parking", isComplete: false, image: "parkingLot"),
        venueItem(name: "Amenities", isComplete: false, image: "amenities"),
        venueItem(name: "Location", isComplete: false, image: "location"),
        venueItem(name: "Ambiance", isComplete: false, image: "ambiance"),
        venueItem(name: "Layout", isComplete: false, image: "layout"),
        venueItem(name: "Packages", isComplete: false, image: "packages"),
        venueItem(name: "Catering", isComplete: false, image: "cateringOptions"),
        venueItem(name: "Restrictions", isComplete: false, image: "restrictions"),
        venueItem(name: "Cleanup Services", isComplete: false, image: "cleanupServices"),
        
    ]
    
    var venueCheckListKey: String
    
    var body: some View {
        if showExpandedView == false{
            Button {
                withAnimation(Animation.easeInOut(duration: 0.3)){
                    showExpandedView = true
                }
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(ColorPalette.lightPeach)
                        .frame(width: 300, height: 80)
                    
                    Text(venueList[0])
                        .textStyle()
                }
            }
            .shadow(radius: 10)
        }
        if showExpandedView{
            ZStack{
                GeometryReader { geometry in
                    Rectangle()
                        .fill(ColorPalette.blushPink)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                }.edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
                        Text(venueList[0])
                            .textStyle()
                            .padding()
                        Spacer()
                    }
                    Spacer()
                    Text("Capacity: \(venueList[1])")
                    Text("Cost: \(venueList[2])$")
                    Text("Check List")
                    ScrollView{
                        ForEach(venueCheckList){ item in
                            ZStack{
                                HStack{
                                    Button {
                                        toggleCompletion(for: item.id)
                                    } label: {
                                        Image(systemName: item.isComplete ? "checkmark.circle.fill" : "circle")
                                            .foregroundColor(.green)
                                            .font(.title3)
                                        ZStack{
                                            Image(item.image)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 300, height: 100)
                                                .clipShape(RoundedRectangle(cornerRadius: 25))
                                            ZStack{
                                                Ellipse()
                                                    .foregroundColor(ColorPalette.gold)
                                                    .frame(width: 150, height: 60)
                                                    .padding(.top, 10)
                                                Text(item.name)
                                                    .foregroundColor(ColorPalette.ivory)
                                                    .smallTextStyle()
                                                
                                            }
                                            
                                        }
                                        .padding()
                                        .shadow(radius: 10)
                                    }
                                    
                                }
                            }
                        }
                    }
                    
                }.onAppear {
                    loadVenueCheckList()
                }
                .onDisappear {
                    saveVenueCheckList()
                }
                VStack{
                    HStack{
                        Spacer()
                        Button {
                            withAnimation(Animation.easeInOut(duration: 0.3)){
                                showExpandedView = false
                            }
                        } label: {
                            Image(systemName: "x.circle")
                                .font(.title)
                                .foregroundColor(.red)
                        }
                    }
                    .padding()
                    Spacer()
                }
            }.transition(.scale)
        }
    }
    private func toggleCompletion(for id: UUID) {
        if let index = venueCheckList.firstIndex(where: { $0.id == id }) {
            venueCheckList[index].isComplete.toggle()
        }
    }
    private func saveVenueCheckList() {
        do {
            let data = try JSONEncoder().encode(venueCheckList)
            UserDefaults.standard.set(data, forKey: venueCheckListKey)
            UserDefaults.standard.synchronize()
        } catch {
            print("Error encoding venueCheckList: \(error.localizedDescription)")
        }
    }
    
    private func loadVenueCheckList() {
        UserDefaults.standard.synchronize()
        if let data = UserDefaults.standard.data(forKey: venueCheckListKey) {
            do {
                venueCheckList = try JSONDecoder().decode([venueItem].self, from: data)
            } catch {
                print("Error decoding venueCheckList: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    VenueOption(venueList: ["Venue Name", "120", "2500"], venueCheckListKey: "venue1")
}
