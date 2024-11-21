//
//  ModuleCompletionEntity.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 20/10/24.
//

import Foundation

struct CompletionEntity {
    var moduleID: String
    var badgeName: String
    var badgeImageName: String
    var achievedAfterCompleting: String
    var bonusMoney: Int
}

enum CompletionEntityType: String, Codable, CaseIterable {
    case basicInvestmentModule
    case liabilitiesVsAssetModule
    case riskAndReturnModule
    case stockRegulatorModule
    case fundamentalModule
    case newsModule
    case sectorModule
    case macroEconomicsModule
    
    var value: CompletionEntity {
        switch self {
        case .basicInvestmentModule:
            return CompletionEntity(
                moduleID: "basicInvestmentModule",
                badgeName: "Basvestment",
                badgeImageName: "badge-basic-investment",
                achievedAfterCompleting: "BasicInvestment Module",
                bonusMoney: 1000000
            )
        case .liabilitiesVsAssetModule:
            return CompletionEntity(
                moduleID: "liabilitiesVsAssetModule",
                badgeName: "LvA",
                badgeImageName: "badge-liabilities-vs-asset",
                achievedAfterCompleting: "LiabilitiesVsAsset Module",
                bonusMoney: 1000000
            )
        case .riskAndReturnModule:
            return CompletionEntity(
                moduleID: "riskAndReturnModule",
                badgeName: "Risk Analyzer",
                badgeImageName: "badge-risk-and-return",
                achievedAfterCompleting: "RiskAndReturn Module",
                bonusMoney: 1000000
            )
        case .stockRegulatorModule:
            return CompletionEntity(
                moduleID: "stockRegulatorModule",
                badgeName: "Profile Hunter",
                badgeImageName: "badge-stock-regulator",
                achievedAfterCompleting: "StockRegulator Module",
                bonusMoney: 1000000
            )
        case .fundamentalModule:
            return CompletionEntity(
                moduleID: "fundamentalModule",
                badgeName: "Investor",
                badgeImageName: "badge-fundamental",
                achievedAfterCompleting: "Fundamental Module",
                bonusMoney: 1000000
            )
        case .newsModule:
            return CompletionEntity(
                moduleID: "newsModule",
                badgeName: "Investor-II",
                badgeImageName: "badge-news",
                achievedAfterCompleting: "News Module",
                bonusMoney: 1000000
            )
        case .sectorModule:
            return CompletionEntity(
                moduleID: "sectorModule",
                badgeName: "Sector",
                badgeImageName: "badge-sector",
                achievedAfterCompleting: "Sector Module",
                bonusMoney: 1000000
            )
        case .macroEconomicsModule:
            return CompletionEntity(
                moduleID: "macroEconomicsModule",
                badgeName: "MacroEconomics",
                badgeImageName: "badge-macro-economics",
                achievedAfterCompleting: "MacroEconomics Module",
                bonusMoney: 1000000
            )
        }
    }
}
