//
//  HanvestSoundFX.swift
//  hanvest
//
//  Created by Bryan Vernanda on 08/11/24.
//

import Foundation

enum HanvestSoundFX {
    case click
    case getBadge
    case correct
    case wrong
    
    var name: String  {
        switch self {
            case .click: return "click"
            case .getBadge: return "get-badge"
            case .correct: return "correct"
            case .wrong: return "wrong"
        }
    }
    
    var volume: Float {
        switch self {
            case .click: return 0.1
            case .getBadge: return 0.5
            case .correct: return 0.5
            case .wrong: return 0.5
        }
    }
}
