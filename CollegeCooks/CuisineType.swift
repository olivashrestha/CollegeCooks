//
//  CuisineType.swift
//  CollegeCooks
//
//  Created by Shrestha, Oliva on 12/12/22.
//

import Foundation
import SwiftUI

enum CuisineType: Int, CaseIterable {
    case african,greek,cajun,french,chinese,korean,mexican,italian,thai,all
    func title() -> String {
        switch self {
        case .african:
            return "african"
        case .greek:
            return "greek"
        case.cajun:
            return "cajun"
        case.french:
            return "french"
        case.chinese:
            return "chinese"
        case.korean:
            return "korean"
        case.mexican:
            return "mexican"
        case.italian:
            return "italian"
        case.thai:
            return "thai"
        case.all:
            return ""
        }
    }
}
