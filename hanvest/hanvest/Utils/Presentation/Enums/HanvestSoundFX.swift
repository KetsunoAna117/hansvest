//
//  HanvestSoundFX.swift
//  hanvest
//
//  Created by Bryan Vernanda on 08/11/24.
//

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
}
