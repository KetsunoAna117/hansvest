//
//  HighlightComponentEnumStage.swift
//  hanvest
//
//  Created by Bryan Vernanda on 30/10/24.
//

enum FundamentalModuleHighlightStage {
    case mainStage
    case buyStage
    case sellStage
    
    var stringValue: String {
        switch self {
            case .mainStage: return "main-stage-module-05"
            case .buyStage: return "buy-stage-module-05"
            case .sellStage: return "sell-stage-module-05"
        }
    }
}
