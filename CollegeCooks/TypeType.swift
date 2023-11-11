//
//  TypeType.swift
//  CollegeCooks
//
//  Created by Shrestha, Oliva on 12/12/22.
//

import Foundation
enum TypeType: Int, CaseIterable {
    
    case breakfast, snack, dessert, beverage, anything
    
    func title() -> String {
        switch self {
        case .breakfast:
            return "Breakfast"
        case .snack:
            return "Snack"
        case .dessert:
            return "Dessert"
        case .beverage:
            return "Drink"
        case .anything:
            return "Anything pls"
    
        }
    }
        
        func emoji() -> String {
            switch self {
            case .breakfast:
                return "🥞"
            case .snack:
                return "🍿"
            case .dessert:
                return "🍰"
            case .beverage:
                return "🧋"
            case .anything:
                return "🍛"
            }
        }
            
            func value() -> String {
                switch self {
                case .breakfast:
                    return "breakfast"
                case .snack:
                    return "snack"
                case .dessert:
                    return "dessert"
                case .beverage:
                    return "beverage"
                case .anything:
                    return ""
                }
    }
}
    
