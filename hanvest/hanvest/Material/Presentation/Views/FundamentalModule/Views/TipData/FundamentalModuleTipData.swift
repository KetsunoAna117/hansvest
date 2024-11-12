//
//  Module05TipData.swift
//  hanvest
//
//  Created by Bryan Vernanda on 30/10/24.
//

import SwiftUI

enum FundamentalModuleTipData: CaseIterable {
    case stocks
    case stocksName
    case stocksPrice
    case gainLoss
    case yourInvestment
    case yourEquity
    case profitLoss
    case companyProfile
    case buyButton
    case tradingBalance
    case amountBuy
    case priceBuy
    case sellButton
    case yourAmountOfStock
    case amountSell
    case priceSell
    case lot
    
    var index: Int {
        return FundamentalModuleTipData.allCases.firstIndex(of: self) ?? 0
    }
    
    var title: String {
        switch self {
            case .stocks:
                return "Stocks"
            case .stocksName:
                return "Stocks Name"
            case .stocksPrice:
                return "Stocks Price"
            case .gainLoss:
                return "Gain/Loss"
            case .yourInvestment:
                return "Your Investment"
            case .yourEquity:
                return "Your Equity"
            case .profitLoss:
                return "Profit/Loss"
            case .companyProfile:
                return "Company Profile"
            case .buyButton:
                return "Buy Button"
            case .tradingBalance:
                return "Trading Balance"
            case .amountBuy, .amountSell:
                return "Amount"
            case .priceBuy, .priceSell:
                return "Price"
            case .sellButton:
                return "Sell Button"
            case .yourAmountOfStock:
                return "Your Amount Of Stock"
            case .lot:
                return "Lot"
        }
    }
    
    var detail: String {
        switch self {
            case .stocks:
                return "Option of stocks that you can buy."
            case .stocksName:
                return "The full name of the stock."
            case .stocksPrice:
                return "The price of the stock for each share."
            case .gainLoss:
                return "The gain or loss of a share from the last price before market close."
            case .yourInvestment:
                return "The amount that you invest in these stocks."
            case .yourEquity:
                return "It's your equity in this stock."
            case .profitLoss:
                return "Your gain or loss on this stock depends on the purchase price."
            case .companyProfile:
                return "You can analyze their company with their profile."
            case .buyButton:
                return "Press to buy stocks."
            case .tradingBalance:
                return "Virtual balance you can use to buy stocks."
            case .amountBuy:
                return "The total amount you want to buy."
            case .priceBuy:
                return "This is the cost of each share you want to buy."
            case .sellButton:
                return "Press to sell stock."
            case .yourAmountOfStock:
                return "The total amount of this stock that you can sell."
            case .amountSell:
                return "The total amount that you will get from the sales."
            case .priceSell:
                return "The cost of each share you want to sell."
            case .lot:
                return "1 lot = 100 shares"
        }
    }
}

