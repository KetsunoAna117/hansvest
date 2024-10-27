//
//  Module06Stage.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 27/10/24.
//

enum Module06Stage {
    case openNews
    case openNewsDetails
    case buyState
    case sellState
    
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
    
    func onComplete(
        moduleRouter: any Module06RouterProtocol,
        profileViewModel: Module06ProfileViewModel,
        simulationViewModel: Module06SimulationViewModel,
        transaction: TransactionStatusViewModel
    ) {
        switch self {
        case .buyState:
            moduleRouter.popToRoot()
        case .sellState:
            moduleRouter.popToRoot()
        case .openNews:
            break
        case .openNewsDetails:
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
