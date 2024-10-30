//
//  Module02PageState.swift
//  hanvest
//
//  Created by Bryan Vernanda on 15/10/24.
//

import Foundation

enum Module02PageState {
    case pageContinue
    case pageCheckout
    case pagePay
    
    var buttonStringValue: String {
        switch self {
            case .pageContinue:
                "Continue"
            case .pageCheckout:
                "Checkout"
            case .pagePay:
                "Pay"
        }
    }

}
