//
//  SettingsView.swift
//  CollegeCooks
//
//  Created by Shrestha, Oliva on 12/12/22.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("colorScheme") var colorScheme = 0
    @AppStorage("Preference") var preference = false
    @AppStorage("Autosave") var autosave = false
    @AppStorage("textColor") var textColor: Color = Color.black
    
    var body: some View {
        ZStack{
            Color("Backgroundcolor").ignoresSafeArea()
        
            Form {
                Section("Appearance") {
                    Picker(selection: $colorScheme, label: Text("Appearance")) {
                        Text("Light").tag(1)
                        Text("Dark").tag(2)
                    }
                    .pickerStyle(.menu)
                }
                Section("Text") {
                    ColorPicker("Color", selection: $textColor)
                }
                Section("Show Prefernce") {
                    Toggle("Preference", isOn: $preference)
                }
                Section("Show Prices") {
                    Toggle("Prices", isOn: $autosave)
                }
            }.foregroundColor(Color("Highlightcolor"))
                .background(Color("Backgroundcolor"))
                .onAppear{
                    UITableView.appearance().backgroundColor = .clear
                }
                .onDisappear(){
                    UITableView.appearance().backgroundColor = .systemGroupedBackground
                }
    }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
