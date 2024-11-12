//
//  Module05ContentView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 24/10/24.
//

enum FundamentalModuleContentView: Equatable, Hashable, Identifiable {
    case buyStage(
        appRouter: any AppRouterProtocol,
        profileViewModel: FundamentalModuleProfileViewModel,
        simulationViewModel: FundamentalModuleSimulationViewModel,
        highlightViewModel: HanvestHighlightViewModel
    )
    case sellStage(
        appRouter: any AppRouterProtocol,
        profileViewModel: FundamentalModuleProfileViewModel,
        simulationViewModel: FundamentalModuleSimulationViewModel,
        highlightViewModel: HanvestHighlightViewModel
    )
    case confirmBuy(
        profileViewModel: FundamentalModuleProfileViewModel,
        simulationViewModel: FundamentalModuleSimulationViewModel,
        highlightViewModel: HanvestHighlightViewModel
    )
    case confirmSell(
        profileViewModel: FundamentalModuleProfileViewModel,
        simulationViewModel: FundamentalModuleSimulationViewModel,
        highlightViewModel: HanvestHighlightViewModel
    )
    case transactionComplete(
        profileViewModel: FundamentalModuleProfileViewModel,
        simulationViewModel: FundamentalModuleSimulationViewModel,
        highlightViewModel: HanvestHighlightViewModel,
        transactionViewModel: TransactionStatusViewModel
    )
    
    var id: Self { return self }
}

extension FundamentalModuleContentView {
    // Conform to Hashable
    func hash(into hasher: inout Hasher) {
        switch self {
        case .buyStage,
                .sellStage,
                .confirmBuy,
                .confirmSell,
                .transactionComplete :
            hasher.combine(self.hashValue)
        }
    }
    
    // Conform to Equatable
    static func == (lhs: FundamentalModuleContentView, rhs: FundamentalModuleContentView) -> Bool {
        switch (lhs, rhs){
        case (.buyStage, .buyStage),
            (.sellStage, .sellStage),
            (.confirmBuy, .confirmBuy),
            (.confirmSell, .confirmSell),
            (.transactionComplete, .transactionComplete):
            return true
        default:
            return false
        }
        
    }
}
