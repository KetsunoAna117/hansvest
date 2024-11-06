//
//  HanvestProfitLossLabelDefaultState.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 11/10/24.
//

import SwiftUI

enum HanvestProfitLossLabelDefaultState{
    case Profit
    case Loss
    case NoChange
    
    var textColor: Color {
        switch self {
        case .Profit:
            return .blizzardBlue400
        case .Loss:
            return .sundown500
        case .NoChange:
            return .labelPrimary
        }
    }
    
    var symbolType: String{
        switch self {
        case .Profit:
            return "+"
        case .Loss:
            return "-"
        case .NoChange:
            return ""
        }
    }
}
