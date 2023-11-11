//
//  Entry.swift
//  CollegeCooks
//
//  Created by Shrestha, Oliva on 12/12/22.
//

import Foundation
import SwiftUI


    struct Entry: Identifiable, Equatable, Codable {
        
        var id = UUID()
        var title: String
        var readyInMinutes: Int
        var servings: Int
        var image: String
        var instructions: String
        var vegetarian: Bool
        var vegan: Bool
        var glutenFree: Bool
        var dairyFree: Bool
        var cheap: Bool
        var pricePerServing: Double
      
    }
