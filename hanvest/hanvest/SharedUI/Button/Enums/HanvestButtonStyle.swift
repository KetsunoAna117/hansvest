//
//  HanvestButtonStyle.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 09/10/24.
//

import SwiftUI

enum HanvestButtonStyle: Equatable {
    case filled(isDisabled: Bool)
    case bordered(isDisabled: Bool)
    case borderless(isDisabled: Bool)
    case filledCorrect(isDisabled: Bool)
    case filledIncorrect(isDisabled: Bool)
    
    // Computed property that extracts the isDisabled alignment for any case
    var isDisabled: Bool {
        switch self {
        case .filled(let isDisabled),
                .bordered(let isDisabled),
                .borderless(let isDisabled),
                .filledCorrect(let isDisabled),
                .filledIncorrect(let isDisabled):
            return isDisabled
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .filled(let isDisabled):
            return isDisabled ? .mineShaft400 : .seagull400
        case .bordered(let isDisabled):
            return isDisabled ? .clear : .mineShaft50
        case .borderless:
            return .clear
        case .filledCorrect(let isDisabled):
            return isDisabled ? .mineShaft400 : .blizzardBlue400
        case .filledIncorrect(let isDisabled):
            return isDisabled ? .mineShaft400 : .sundown500
        }
    }
    
    var fontColor: Color {
        switch self {
        case .filled, .filledCorrect, .filledIncorrect:
            return .mineShaft50
        case .bordered(let isDisabled):
            return isDisabled ? .labelTertiary : .seagull500
        case .borderless(let isDisabled):
            return isDisabled ? .labelTertiary : .seagull500
        }
    }
    
    var borderColor: Color {
        switch self {
        case .filled, .borderless, .filledCorrect, .filledIncorrect:
            return .clear
        case .bordered(let isDisabled):
            return isDisabled ? .labelTertiary : .seagull300
        }
    }
    
    var shadowColor: Color {
        switch self {
        case .filled(let isDisabled):
            return isDisabled ? .mineShaft500 : .seagull500
        case .bordered(let isDisabled):
            return isDisabled ? .clear : .seagull300
        case .borderless:
            return .clear
        case .filledCorrect(let isDisabled):
            return isDisabled ? .mineShaft500 : .blizzardBlue500
        case .filledIncorrect(let isDisabled):
            return isDisabled ? .mineShaft500 : .sundown600
        }
    }
}
