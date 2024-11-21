//
//  Module05Stage.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 25/10/24.
//

import Foundation

enum FundamentalModuleStage: Equatable {
    case buyStage(appRouter: any AppRouterProtocol)
    case sellStage (appRouter: any AppRouterProtocol)
    
    func onComplete(
        moduleRouter: any FundamentalModuleRouterProtocol,
        profileViewModel: FundamentalModuleProfileViewModel,
        simulationViewModel: FundamentalModuleSimulationViewModel,
        highlightViewModel: HanvestHighlightViewModel,
        transaction: TransactionStatusViewModel
    ) {
        switch self {
        case .buyStage(let appRouter):
            moduleRouter.popToRoot()
            moduleRouter.addProgress()
            moduleRouter.push(
                .sellStage(
                    appRouter: appRouter,
                    profileViewModel: profileViewModel,
                    simulationViewModel: simulationViewModel,
                    highlightViewModel: highlightViewModel
                )
            )
            simulationViewModel.currentStage = .sellStage(appRouter: appRouter)
            profileViewModel.addUserInvestmentTransaction(
                transaction:
                    StockInvestmentEntity(
                        investmentID: UUID().uuidString,
                        stockIDName: transaction.selectedStockIDName,
                        totalInvested: transaction.stockPrice * transaction.lotAmount * 100,
                        lotPurchased: transaction.lotAmount,
                        stockTransaction: [
                            .init(
                                transactionID: UUID().uuidString,
                                stockIDName: transaction.selectedStockIDName,
                                priceAtPurchase: transaction.stockPrice,
                                stockLotQuantity: transaction.lotAmount,
                                time: Date.now
                            )
                        ]
                    )
            )
            
            simulationViewModel.appendNewStockPrice()

        case .sellStage(let appRouter):
            @Inject var validateModule: ValidateIfUserHasCompletedTheModule
            
            do {
                let hasCompletedModule = try validateModule.execute(specificModule: .fundamentalModule)
                
                if hasCompletedModule {
                    appRouter.popToRoot()
                }
                else {
                    appRouter.push(
                        .moduleCompletion(completionItem: .fundamentalModule)
                    )
                }
            }
            catch {
                debugPrint("[ERROR]: \(error)")
            }

        }
    }
}

extension FundamentalModuleStage {
    // Conform to Equatable
    static func == (lhs: FundamentalModuleStage, rhs: FundamentalModuleStage) -> Bool {
        switch (lhs, rhs) {
        case (.buyStage, .buyStage),
            (.sellStage, .sellStage):
            return true
            
        default:
            return false
        }
    }
}
