//
//  Module06Stage.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 27/10/24.
//

enum NewsModuleStage: Equatable {
    case openNews(appRouter: any AppRouterProtocol)
    case openNewsDetails(appRouter: any AppRouterProtocol)
    case buyState(appRouter: any AppRouterProtocol)
    case sellState(appRouter: any AppRouterProtocol)
    
    var getAppRouter: any AppRouterProtocol {
        switch self {
        case .openNews(let appRouter):
            return appRouter
        case .openNewsDetails(let appRouter):
            return appRouter
        case .buyState(let appRouter):
            return appRouter
        case .sellState(let appRouter):
            return appRouter
        }
    }
    
    var shouldBuyAndSellButtonDisabled: Bool {
        switch self {
        case .openNews:
            return true
        case .openNewsDetails:
            return false
        case .buyState:
            return false
        case .sellState:
            return false
        }
    }
    
    func onTransactionSuccess(
        moduleRouter: any NewsModuleRouterProtocol,
        profileViewModel: NewsModuleProfileViewModel,
        simulationViewModel: NewsModuleSimulationViewModel,
        transaction: TransactionStatusViewModel
    ) {
        switch self {
        case .buyState(let appRouter):
            moduleRouter.push(
                .conclusion(
                    appRouter: appRouter,
                    simulationViewModel: simulationViewModel
                )
            )
        case .sellState(let appRouter):
            moduleRouter.push(
                .conclusion(
                    appRouter: appRouter,
                    simulationViewModel: simulationViewModel
                )
            )
        case .openNews(_):
            break
        case .openNewsDetails(_):
            break
        }
    }
    
    var choiceConclusionTitle: String {
        switch self {
        case .openNews:
            return ""
        case .openNewsDetails:
            return ""
        case .buyState:
            return "What if you buy?"
        case .sellState:
            return "What if you sell?"
        }
    }
    
    var choiceConclusionContent: String {
        switch self {
        case .openNews:
            return ""
        case .openNewsDetails:
            return ""
        case .buyState:
            return """
                    For those looking to buy, this could be a favorable time if you believe in GOTE’s growth potential. The backing from Alibaba could accelerate GOTE’s expansion in Indonesia, enhance its technological capabilities, and create more competitive advantages in e-commerce and on-demand services. With increased resources, GOTE is better positioned to capture a larger market share, possibly driving up the stock’s value over time.
                    """
        case .sellState:
            return """
                    If you're cautious about the risks, selling might be considered if the current stock price has already surged significantly from the news, as early surges often reflect immediate investor excitement. While Alibaba’s investment is promising, it’s not a guaranteed path to profitability. Factors such as GOTE’s competition, broader economic conditions, and execution challenges in expanding its ecosystem could impact its long-term success.
                    """
        }
    }
}

extension NewsModuleStage {
    // Conform to Equatable
    static func == (lhs: NewsModuleStage, rhs: NewsModuleStage) -> Bool {
        switch (lhs, rhs) {
        case (.openNews, .openNews),
            (.openNewsDetails, .openNewsDetails),
            (.buyState, .buyState),
            (.sellState, .sellState):
            return true
        default:
            return false
        }
    }
}
