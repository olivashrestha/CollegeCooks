//
//  CollegeCooksApp.swift
//  CollegeCooks
//
//  Created by Shrestha, Oliva on 12/12/22.
//

import SwiftUI


@main
struct CollegeCooksApp: App {
    @Environment(\.scenePhase) var scenePhase
    var entriesVM: EntriesVM
    
    init() {
        entriesVM = EntriesVM(items: FileManager.default.getEntries())
    }

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(entriesVM)
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .inactive {
                print("Inactive")
            } else if newPhase == .active {
                print("Active")
            } else if newPhase == .background {
                print("Background")
                FileManager.default.saveItems(items: entriesVM.entrys)
            }
        }
    }}
