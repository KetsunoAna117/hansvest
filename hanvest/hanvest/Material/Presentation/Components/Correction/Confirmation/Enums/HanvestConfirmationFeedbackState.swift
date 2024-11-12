//
//  HanvestConfirmationFeedbackState.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 10/10/24.
//

import SwiftUI

enum HanvestConfirmationFeedbackState {
    case correct
    case incorrect
    
    var content: String {
        switch self {
            case .correct:
                return "Excellent!"
            case .incorrect:
                return "Unlucky"
        }
    }
    
    var backgroundColor: Color {
        switch self {
            case .correct:
                return .blizzardBlue100
            case .incorrect:
                return .sundown100
        }
    }
    
    var fontColor: Color {
        switch self {
            case .correct:
                return .blizzardBlue400
            case .incorrect:
                return .sundown500
        }
    }
    
    var buttonStyle: HanvestButtonStyle {
        switch self {
            case .correct:
                return .filledCorrect(isDisabled: false)
            case .incorrect:
                return .filledIncorrect(isDisabled: false)
        }
    }
    
    var iconType: HanvestCorrectionSymbolState {
        switch self {
            case .correct:
                return .correct
            case .incorrect:
                return .incorrect
        }
    }
    
    var soundFX: HanvestSoundFX {
        switch self {
            case .correct:
                return HanvestSoundFX.correct
            case .incorrect:
                return HanvestSoundFX.wrong
        }
    }
}
