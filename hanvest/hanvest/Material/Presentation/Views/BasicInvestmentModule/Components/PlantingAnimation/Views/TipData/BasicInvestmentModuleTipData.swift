//
//  Module01TipData.swift
//  hanvest
//
//  Created by Bryan Vernanda on 11/11/24.
//

enum BasicInvestmentModuleTipData: CaseIterable {
    case waterCan
    
    var index: Int {
        return BasicInvestmentModuleTipData.allCases.firstIndex(of: self) ?? 0
    }
    
    var title: String {
        switch self {
            case .waterCan:
                return "Let's Start Planting!"
        }
    }
    
    var detail: String {
        switch self {
            case .waterCan:
                return "Grab to water the plant."
        }
    }
}
