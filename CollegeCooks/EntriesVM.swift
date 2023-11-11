//
//  EntriesVM.swift
//  CollegeCooks
//
//  Created by Shrestha, Oliva on 12/12/22.
//

import Foundation
import UIKit
class EntriesVM: ObservableObject {
    
    @Published var entrys: [Entry]
    
    init(items: [Entry]) {
        self.entrys = items
    }

    // MARK: - Utilty

    func add(title:String, time: Int, servings: Int, image: String, ins: String, veg:Bool,vegan :Bool, gluten: Bool, dairy:Bool, cheap:Bool, price: Double) {
        entrys.insert(Entry(title: title, readyInMinutes: time, servings:servings, image: image, instructions: ins, vegetarian: veg, vegan: vegan, glutenFree: gluten, dairyFree: dairy, cheap: cheap, pricePerServing: price), at: 0)
    }

    func move(from source: IndexSet, to destination: Int) {
        entrys.move(fromOffsets: source, toOffset: destination)
    }

    func remove(offsets: IndexSet) {
        entrys.remove(atOffsets: offsets)
    }
    func removeall(){
        entrys.removeAll()
    }
}

