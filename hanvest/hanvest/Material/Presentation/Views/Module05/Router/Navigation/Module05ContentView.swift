//
//  Module05ContentView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 24/10/24.
//

enum Module05ContentView: Equatable, Hashable, Identifiable {
    case buyStage(profileViewModel: Module05ProfileViewModel, simulationViewModel: HanvestSimulationViewModel)
    case sellStage(profileViewModel: Module05ProfileViewModel, simulationViewModel: HanvestSimulationViewModel)
    case confirmBuy(profileViewModel: Module05ProfileViewModel, simulationViewModel: HanvestSimulationViewModel)
    case confirmSell(profileViewModel: Module05ProfileViewModel, simulationViewModel: HanvestSimulationViewModel)
    case transactionComplete(profileViewModel: Module05ProfileViewModel, simulationViewModel: HanvestSimulationViewModel)
    
    var id: Self { return self }
}

extension Module05ContentView {
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
    static func == (lhs: Module05ContentView, rhs: Module05ContentView) -> Bool {
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
