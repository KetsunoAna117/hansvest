//
//  HanvestSoundFX.swift
//  hanvest
//
//  Created by Bryan Vernanda on 08/11/24.
//

enum HanvestSoundFX {
    case click
    case badge
    case correct
    case wrong
    
    var name: String  {
        switch self {
            case .click: return "mixkit-arcade-game-jump-coin-216"
            case .badge: return "brass-new-level-151765"
            case .correct: return "correct-6033"
            case .wrong: return "wrong-answer-126515"
        }
    }
}
