//
//  Module03MultipleChoice.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import Foundation

enum RiskAndReturnModuleMultipleChoicePageContent: Int, CaseIterable {
    case page01 = 0
    
    var question: String {
        switch self {
            case .page01:
                "Buy 1 product of invesment"
        }
    }
    
    var options: [String] {
        switch self {
            case .page01:
                [
                    "Buy deposito (Rp 10.000.000)",
                    "Buy Government Bonds (Rp 10.000.000)",
                    "Buy Stocks (Rp 10.000.000)"
                ]
        }
    }
}
