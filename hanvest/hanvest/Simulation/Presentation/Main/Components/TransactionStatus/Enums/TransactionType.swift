//
//  TransactionType.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 19/10/24.
//

enum TransactionType {
    case buy
    case sell
    
    var description: String {
        switch self {
            case .buy: return "placed to buy"
            case .sell: return "placed to sell"
        }
    }
}
