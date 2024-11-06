//
//  Module06Stage.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 27/10/24.
//

enum Module06Stage: Equatable {
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
        moduleRouter: any Module06RouterProtocol,
        profileViewModel: Module06ProfileViewModel,
        simulationViewModel: Module06SimulationViewModel,
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
            return "You have bought your stocks"
        case .sellState:
            return "You have sold your stocks"
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
                    Lorem ipsum dolor sit amet consectetur. Malesuada lectus id quam congue neque odio dignissim. Diam viverra enim velit euismod duis. A urna facilisi id vestibulum. Maecenas velit dolor semper sagittis enim arcu. Arcu hac eu eget sed. Vulputate viverra leo id quis pellentesque lacus lorem aliquet. Ipsum pellentesque habitasse molestie nunc id. At nec facilisis malesuada facilisis facilisis nunc. Vitae lorem nisi molestie consequat vitae 
                    """
        case .sellState:
            return """
                    Lorem ipsum dolor sit amet consectetur. Malesuada lectus id quam congue neque odio dignissim. Diam viverra enim velit euismod duis. A urna facilisi id vestibulum. Maecenas velit dolor semper sagittis enim arcu. Arcu hac eu eget sed. Vulputate viverra leo id quis pellentesque lacus lorem aliquet. Ipsum pellentesque habitasse molestie nunc id. At nec facilisis malesuada facilisis facilisis nunc. Vitae lorem nisi molestie consequat vitae 
                    """
        }
    }
}

extension Module06Stage {
    // Conform to Equatable
    static func == (lhs: Module06Stage, rhs: Module06Stage) -> Bool {
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
