//
//  HanvestButtonSelectedState.swift
//  hanvest
//
//  Created by Bryan Vernanda on 23/10/24.
//

import SwiftUI

enum HanvestButtonMultipleChoiceStyle {
    case selected
    case unselected
    case filledCorrect
    case filledIncorrect
    
    var backgroundColor: Color {
        switch self {
            case .selected:
                return .seagull400
            case .unselected:
                return .mineShaft50
            case .filledCorrect:
                return  .blizzardBlue400
            case .filledIncorrect:
                return .sundown500
        }
    }
    
    var fontColor: Color {
        switch self {
            case .selected, .filledCorrect, .filledIncorrect:
                return .mineShaft50
            case .unselected:
                return .seagull500
        }
    }
    
    var borderColor: Color {
        switch self {
            case .selected:
                return .seagull400
            case .unselected:
                return .seagull300
            case .filledCorrect, .filledIncorrect:
                return .blizzardBlue400
        }
    }
    
    var shadowColor: Color {
        switch self {
            case .selected:
                return .seagull500
            case .unselected:
                return .seagull300
            case .filledCorrect:
                return .blizzardBlue500
            case .filledIncorrect:
                return .sundown600
        }
    }
    
    var image: Image? {
        switch self {
            case .filledCorrect:
                return Image(systemName: "checkmark")
            case .filledIncorrect:
                return Image(systemName: "xmark")
            case .selected, .unselected:
                    return nil
        }
    }
}
