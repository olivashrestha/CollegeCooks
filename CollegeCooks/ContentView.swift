//
//  ContentView.swift
//  CollegeCooks
//
//  Created by Shrestha, Oliva on 12/12/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("colorScheme") var colorScheme = 0
    @EnvironmentObject var entriesVM: EntriesVM
   @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Color("Backgroundcolor").ignoresSafeArea()
        TabView {
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "icloud")
                }
            ListView()
                .tabItem {
                    Label("List", systemImage: "list.bullet.rectangle.portrait")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
            InfoView()
                .tabItem {
                    Label("Info", systemImage: "questionmark.app.fill")
                }
        }
        .preferredColorScheme(colorScheme == 1 ? .light : colorScheme == 2 ? .dark : nil)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(EntriesVM(items: [Entry]()))
    }
}
