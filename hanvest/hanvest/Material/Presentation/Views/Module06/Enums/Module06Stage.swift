//
//  Module06Stage.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 27/10/24.
//

enum Module06Stage {
    case buyState
    case sellState
    
    func onComplete(
        moduleRouter: any Module06RouterProtocol,
        profileViewModel: Module06ProfileViewModel,
        simulationViewModel: Module06SimulationViewModel,
        transaction: TransactionStatusViewModel
    ) {
        switch self {
        case .buyState:
            break
        case .sellState:
            break
        }
    }
}
