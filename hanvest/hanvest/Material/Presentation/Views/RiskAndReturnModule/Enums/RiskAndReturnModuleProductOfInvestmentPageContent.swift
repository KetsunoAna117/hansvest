//
//  Module03ProductOfInvestmentContent.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import Foundation

enum RiskAndReturnModuleProductOfInvestmentPageContent: Int, CaseIterable {
    case page02 = 1
    case page03 = 2
    case page04 = 3
    
    var title: String {
        switch self {
            case .page02:
                "Welcome to day 30"
            case .page03:
                "Welcome to day 60"
            case .page04:
                "Welcome to day 90"
        }
    }
    
    
}
