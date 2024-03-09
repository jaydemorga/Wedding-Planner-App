//
//  groom.swift
//  Wedding Planner
//
//  Created by jayden morgan on 2/20/24.
//

import SwiftUI

struct groom: View {
    @State private var task = ""
    @State private var showAddItemView = false
    @State private var items: [String] = (UserDefaults.standard.array(forKey: "groomToDoList") as? [String] ?? ["Rent Tuxedo"])
    @State private var isCompleteList: [Bool] = (UserDefaults.standard.array(forKey: "groomIsCompleteList") as? [Bool] ?? [false])
    @State private var showDelete = false
    @State private var goThrough = false
    @State private var itemNumber = 0
    @State private var remainingFunds = (UserDefaults.standard.string(forKey: "savedBudget") ?? "")
    @State private var newCost = ""
    @State private var newTotal = 0.0
    private var isCompleteKey = "groomIsCompleteList"
    private var key = "groomToDoList"
    var body: some View {
        ZStack{
            VStack{
                Text("Groom's To Do:")
                    .textStyle()
                    .padding(.top,100)
                ScrollView{
                    ForEach (items.indices, id: \.self) {item in
                        HStack{
                            Button {
                                isCompleteList[item].toggle()
                                addIsCompleteDefault(isCompleteList)
                            } label: {
                                Image(systemName: isCompleteList[item] ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(.green)
                            }
                            Text(items[item])
                                .smallTextStyle()
                            Spacer()
                            Button {
                                showDelete = true
                                itemNumber = item
                            } label: {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                                
                            }
                        }
                        .padding()
                    }
                }
                HStack{
                    Button {
                        showAddItemView.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .buttonStyle()
                    }
                    
                }
//                VStack{
//                    Text("Remaining Funds: \(remainingFunds)")
//                    TextField("Estimated Costs: ", text: $newCost)
//                    Button {
//                        newTotal = (Double(remainingFunds) ?? 0.0) - (Double(newCost) ?? 0.0)
//                        UserDefaults.standard.set(newTotal, forKey: "savedBudget")
//                        remainingFunds = (UserDefaults.standard.string(forKey: "savedBudget") ?? "0.0")
//                    } label: {
//                        Text("Save")
//                            .buttonStyle()
//                    }
//                }
            }
            if showAddItemView{
                ZStack{
                    GeometryReader { geometry in
                        Rectangle()
                            .fill(ColorPalette.ivory)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                        }.edgesIgnoringSafeArea(.all)
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            ZStack{
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(ColorPalette.blushPink)
                                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.6)
                                VStack{
                                    Spacer()
                                    Text("Add A New Task")
                                        .textStyle()
                                    TextField("Enter Task", text: $task)
                                        .padding(.horizontal, 80)
                                    Spacer()
                                    Button {
                                        if task != ""{
                                            isCompleteList.append(false)
                                            addIsCompleteDefault(isCompleteList)
                                            items.append(task)
                                            addDefault(items)
                                            task = ""
                                        }
                                        showAddItemView = false
                                    } label: {
                                        Text("Add")
                                            .buttonStyle()
                                    }

                                }
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                }
            }
           
            if showDelete{
                ConfirmDelete(showView: $showDelete, items: $items, item: $itemNumber, isCompleteList: $isCompleteList, isCompleteKey: isCompleteKey, key: key)
            }
        }
    }
    func addDefault(_ items: [String]){
        UserDefaults.standard.set(items, forKey: key)
        UserDefaults.standard.synchronize()
    }
    func addIsCompleteDefault(_ items: [Bool]){
        UserDefaults.standard.set(items, forKey: isCompleteKey)
        UserDefaults.standard.synchronize()
    }
}

#Preview {
    groom()
}
