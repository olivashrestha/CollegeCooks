//
//  Recipe.swift
//  CollegeCooks
//
//  Created by Shrestha, Oliva on 12/12/22.
//

import Foundation
struct Profile: Decodable{
    var recipes: [Inside]
}
struct Ingredients: Decodable, Identifiable{
    
    var id: Int
    var name: String
}

struct Inside: Decodable{
    var title: String
    var cookingMinutes: Int
    var readyInMinutes: Int
    var servings: Int
    var image: String
    var summary: String
    var instructions: String
    var extendedIngredients:[Ingredients]
    var vegetarian: Bool
    var vegan: Bool
    var glutenFree: Bool
    var dairyFree: Bool
    var cheap: Bool
    var pricePerServing: Double
  
}

struct Recipe: Decodable {
    
    var symbol: String
    var profile: Profile
    
    
}

