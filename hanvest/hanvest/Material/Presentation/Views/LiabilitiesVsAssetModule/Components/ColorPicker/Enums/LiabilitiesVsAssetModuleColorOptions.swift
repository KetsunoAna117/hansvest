//
//  HanvestModule02ColorPicker.swift
//  hanvest
//
//  Created by Bryan Vernanda on 15/10/24.
//

import SwiftUI

enum LiabilitiesVsAssetModuleColorOptions: CaseIterable {
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
    
    var colorDescription: String {
        switch self {
            case .beige:
                return "beige"
            case .sandpaper:
                return "sandpaper"
            case .semiWhite:
                return "white"
            case .spaceGray:
                return "spaceGray"
        }
    }
}
