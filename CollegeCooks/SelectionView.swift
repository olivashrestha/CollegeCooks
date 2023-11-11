//
//  SelectionView.swift
//  CollegeCooks
//
//  Created by Shrestha, Oliva on 12/12/22.
//

import SwiftUI

struct SelectionView: View {
    @AppStorage("cuisine") var cuisine = CuisineType.chinese
    @AppStorage("type") var type = TypeType.anything
    @AppStorage("maxReadyTime") var maxreadytime = 0
    @AppStorage("keyword") var keyword = ""
    @ObservedObject var notificationMgr = NotificationMgr()
    
    @State private var alert = Date()
    
        var body: some View {
        
                Form {
                    Section("Cuisine") {
                        Picker("Cuisine", selection: $cuisine){
                            ForEach (CuisineType.allCases, id: \.self){ item in
                                Text(item.title())
                            }
                        }.pickerStyle(.menu)
                    }
                    Section("Type") {
                        Picker("Type", selection: $type){
                            ForEach (TypeType.allCases, id: \.self){ item in
                                
                                Text(item.emoji())
                                
                            }
                        }.pickerStyle(.segmented)
                    }
                    
                    Section("Max Ready Time") {
                        HStack{
                            Text("Max time: ").font(.body)
                            TextField("max time", value: $maxreadytime, format: .number).keyboardType(.numberPad)
                        }
                            
                    }
                    Section("Word to include in search") {
                        HStack{
                            TextField("type word", text: $keyword)
                        }
                        }
                    
                    Section("Date") {
                        DatePicker("When:", selection: $alert)
                            .datePickerStyle(GraphicalDatePickerStyle())
                        HStack {
                            Button(action: {
                                notificationMgr.scheduleNotification(title: "Time to cook:", notes: " What do you want to eat today? Let's find something", date: alert)

                            }, label: {
                                Text("Save time")
                            })
                            
                        }
                    }
                    }
                   
                }
            }
    
    

struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView()
    }
}
