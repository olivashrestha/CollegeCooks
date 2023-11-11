//
//  FileManager+Entries.swift
//  Journal
//
//  Created by Shrestha, Oliva on 11/19/22.
//

import Foundation
let fileName = "JournalFile.json"

extension FileManager {
       
    func getEntries() -> [Entry] {
        
        if let url = urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(fileName, isDirectory: false) {
            if let jsondata = contents(atPath: url.path) {
                let decoder = JSONDecoder()
                do {
                    let items = try decoder.decode([Entry].self, from: jsondata)
                    return items
                } catch { fatalError(error.localizedDescription) }
            }
        }
        
        return [Entry]()
    }
    
    func saveItems(items: [Entry]) {
        if let url = urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(fileName, isDirectory: false) {
            if fileExists(atPath: url.path) {
                do {
                    try removeItem(at: url)
                } catch { fatalError(error.localizedDescription) }
            }
            
            if let encodedData = try? JSONEncoder().encode(items) {
                createFile(atPath: url.path, contents: encodedData, attributes: nil)
            } else {
                fatalError("Couldn't write data!")
            }
        }
    }
}
