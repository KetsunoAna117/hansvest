//
//  Module06ContentView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 27/10/24.
//

import Foundation

enum Module06ContentView: Equatable, Hashable, Identifiable  {
    case simulation(
        appRouter: any AppRouterProtocol,
        profileViewModel: Module06ProfileViewModel,
        simulationViewModel: Module06SimulationViewModel
    )
    case confirmBuy(
        appRouter: any AppRouterProtocol,
        profileViewModel: Module06ProfileViewModel,
        simulationViewModel: Module06SimulationViewModel
    )
    case confirmSell(
        appRouter: any AppRouterProtocol,
        profileViewModel: Module06ProfileViewModel,
        simulationViewModel: Module06SimulationViewModel
    )
    case transactionComplete(
        profileViewModel: Module06ProfileViewModel,
        simulationViewModel: Module06SimulationViewModel,
        transactionViewModel: TransactionStatusViewModel
    )
    case notification(
        appRouter: any AppRouterProtocol,
        profileViewModel: Module06ProfileViewModel,
        simulationViewModel: Module06SimulationViewModel
    )
    case newsDetail(
        appRouter: any AppRouterProtocol,
        notification: UserNotificationEntity,
        simulationViewModel: Module06SimulationViewModel
    )
    case conclusion(
        appRouter: any AppRouterProtocol,
        simulationViewModel: Module06SimulationViewModel
    )
    
    var id: Self { return self }
}

extension Module06ContentView {
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
    static func == (lhs: Module06ContentView, rhs: Module06ContentView) -> Bool {
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
