//
//  Module06ContentView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 27/10/24.
//

import Foundation

enum NewsModuleContentView: Equatable, Hashable, Identifiable  {
    case simulation(
        appRouter: any AppRouterProtocol,
        profileViewModel: NewsModuleProfileViewModel,
        simulationViewModel: NewsModuleSimulationViewModel
    )
    case confirmBuy(
        appRouter: any AppRouterProtocol,
        profileViewModel: NewsModuleProfileViewModel,
        simulationViewModel: NewsModuleSimulationViewModel
    )
    case confirmSell(
        appRouter: any AppRouterProtocol,
        profileViewModel: NewsModuleProfileViewModel,
        simulationViewModel: NewsModuleSimulationViewModel
    )
    case transactionComplete(
        profileViewModel: NewsModuleProfileViewModel,
        simulationViewModel: NewsModuleSimulationViewModel,
        transactionViewModel: TransactionStatusViewModel
    )
    case notification(
        appRouter: any AppRouterProtocol,
        profileViewModel: NewsModuleProfileViewModel,
        simulationViewModel: NewsModuleSimulationViewModel
    )
    case newsDetail(
        appRouter: any AppRouterProtocol,
        notification: UserNotificationEntity,
        simulationViewModel: NewsModuleSimulationViewModel
    )
    case conclusion(
        appRouter: any AppRouterProtocol,
        simulationViewModel: NewsModuleSimulationViewModel
    )
    
    var id: Self { return self }
}

extension NewsModuleContentView {
    // Conform to Hashable
    func hash(into hasher: inout Hasher) {
        switch self {
        case .simulation,
                .notification,
                .confirmBuy,
                .confirmSell,
                .newsDetail,
                .transactionComplete,
                .conclusion:
            hasher.combine(self.hashValue)
        }
    }
    
    // Conform to Equatable
    static func == (lhs: NewsModuleContentView, rhs: NewsModuleContentView) -> Bool {
        switch (lhs, rhs){
        case (.simulation, .simulation),
            (.notification, .notification),
            (.confirmBuy, .confirmBuy),
            (.confirmSell, .confirmSell),
            (.newsDetail, .newsDetail),
            (.transactionComplete, .transactionComplete),
            (.conclusion, .conclusion):
            return true
        default:
            return false
        }
        
    }
}
