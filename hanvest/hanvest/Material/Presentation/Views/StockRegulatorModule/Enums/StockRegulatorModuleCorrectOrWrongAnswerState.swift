//
//  Module04ShowingCorrectOrWrongAnswer.swift
//  hanvest
//
//  Created by Bryan Vernanda on 19/10/24.
//

import Foundation

enum StockRegulatorModuleCorrectOrWrongAnswerState {
    case isShowing
    case isNotShowing
    
    mutating func toggle() {
        self = (self == .isShowing) ? .isNotShowing : .isShowing
    }
}
