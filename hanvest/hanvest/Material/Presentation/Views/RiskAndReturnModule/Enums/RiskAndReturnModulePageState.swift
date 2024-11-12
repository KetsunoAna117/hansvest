//
//  Module03PageState.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import Foundation

enum RiskAndReturnModulePageState {
    case pageContinue
    case pageNextMonth
    
    var buttonStringValue: String {
        switch self {
            case .pageContinue:
                "Continue"
            case .pageNextMonth:
                "Next Month"
        }
    }
}
