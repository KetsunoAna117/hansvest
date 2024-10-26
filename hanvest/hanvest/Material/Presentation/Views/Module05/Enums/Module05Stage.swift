//
//  Module05Stage.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 25/10/24.
//

import Foundation

enum Module05Stage: Equatable {
    case buyStage(appRouter: any AppRouterProtocol)
    case sellStage (appRouter: any AppRouterProtocol)
    
    func onComplete(
        moduleRouter: any Module05RouterProtocol,
        profileViewModel: Module05ProfileViewModel,
        simulationViewModel: HanvestSimulationViewModel
    ) {
        switch self {
        case .buyStage(let appRouter):
            moduleRouter.popToRoot()
            moduleRouter.addProgress()
            moduleRouter.push(
                .sellStage(
                    appRouter: appRouter,
                    profileViewModel: profileViewModel,
                    simulationViewModel: simulationViewModel
                )
            )
            simulationViewModel.currentStage = .sellStage(appRouter: appRouter)
            

        case .sellStage(let appRouter):
            appRouter.push(
                .moduleCompletion(completionItem: .module05)
            )
        }
    }
}

extension Module05Stage {
    // Conform to Equatable
    static func == (lhs: Module05Stage, rhs: Module05Stage) -> Bool {
        switch (lhs, rhs) {
        case (.buyStage, .buyStage),
            (.sellStage, .sellStage):
            return true
            
        default:
            return false
        }
    }
}
