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
        simulationViewModel: Module06SimulationViewModel,
        newsViewModel: Module06NewsViewModel
    )
    case confirmBuy(
        profileViewModel: Module06ProfileViewModel,
        simulationViewModel: Module06SimulationViewModel
    )
    case confirmSell(
        profileViewModel: Module06ProfileViewModel,
        simulationViewModel: Module06SimulationViewModel
    )
    case transactionComplete(
        profileViewModel: Module06ProfileViewModel,
        simulationViewModel: Module06SimulationViewModel,
        transactionViewModel: TransactionStatusViewModel
    )
    case notification(
        profileViewModel: Module06ProfileViewModel,
        simulationViewModel: Module06SimulationViewModel,
        notificationViewModel: Module06NewsViewModel
    )
    
    case newsDetail(
        news: SimulationNewsEntity
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
                .transactionComplete:
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
            (.transactionComplete, .transactionComplete):
            return true
        default:
            return false
        }
        
    }
}
