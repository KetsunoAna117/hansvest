//
//  MainViewTipData.swift
//  hanvest
//
//  Created by Bryan Vernanda on 01/11/24.
//

enum MainViewTipData: CaseIterable {
    case virtualBalance
    case moduleIntro
    
    var index: Int {
        return MainViewTipData.allCases.firstIndex(of: self) ?? 0
    }
    
    var title: String {
        switch self {
            case .virtualBalance:
                return "Virtual Balance"
            case .moduleIntro:
                return "Learning Module"
        }
    }
    
    var detail: String {
        switch self {
            case .virtualBalance:
                return "In app money."
            case .moduleIntro:
                return "This is your module journey, finish each module for the first time to earn some virtual balance."
        }
    }
}
