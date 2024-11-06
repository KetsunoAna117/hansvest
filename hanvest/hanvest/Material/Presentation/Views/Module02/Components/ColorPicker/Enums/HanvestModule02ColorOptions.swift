//
//  HanvestModule02ColorPicker.swift
//  hanvest
//
//  Created by Bryan Vernanda on 15/10/24.
//

import SwiftUI

enum HanvestModule02ColorOptions: CaseIterable {
    case beige
    case sandpaper
    case semiWhite
    case spaceGray
    
    var colorOptions: Color {
        switch self {
            case .beige:
                return .beige
            case .sandpaper:
                return .sandpaper
            case .semiWhite:
                return .semiWhite
            case .spaceGray:
                return .spaceGray
        }
    }
    
    // only for checkIsDisabled at Module02View only, not really important
    var colorDescription: String {
        switch self {
            case .beige:
                return "Beige"
            case .sandpaper:
                return "Sandpaper"
            case .semiWhite:
                return "SemiWhite"
            case .spaceGray:
                return "SpaceGray"
        }
    }
}
