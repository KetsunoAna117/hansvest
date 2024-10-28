//
//  Placeholder-Tipkit.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 26/10/24.
//

import TipKit

enum Module05Tip: Tip {
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
    case lot
    case sellButton
    case yourAmountOfStock
    case amountSell
    case priceSell

    var id: String {
        return String(describing: self)
    }

    var title: Text {
        switch self {
            case .stocks:
                Text("Stocks")
            case .stocksName:
                Text("Stocks Name")
            case .stocksPrice:
                Text("Stocks Price")
            case .gainLoss:
                Text("Gain/Loss")
            case .yourInvestment:
                Text("Your Investment")
            case .yourEquity:
                Text("Your Equity")
            case .profitLoss:
                Text("Profit/Loss")
            case .companyProfile:
                Text("Company Profile")
            case .buyButton:
                Text("Buy Button")
            case .tradingBalance:
                Text("Trading Balance")
            case .amountBuy, .amountSell:
                Text("Amount")
            case .priceBuy, .priceSell:
                Text("Price")
            case .lot:
                Text("Lot")
            case .sellButton:
                Text("Sell Button")
            case .yourAmountOfStock:
                Text("Your Amount Of Stock")
        }
    }

    var message: Text? {
        switch self {
            case .stocks:
                Text("Option of stocks that you can buy.")
            case .stocksName:
                Text("The full name of the stock.")
            case .stocksPrice:
                Text("The price of the stock for each share.")
            case .gainLoss:
                Text("The gain or loss of a share from the last price before market close.")
            case .yourInvestment:
                Text("The amount that you invest in this stocks.")
            case .yourEquity:
                Text("It's your equity in this stock.")
            case .profitLoss:
                Text("The amount you get or loss from this stock based on the price you buy.")
            case .companyProfile:
                Text("You can analysis their company with their profile.")
            case .buyButton:
                Text("Press to buy stocks.")
            case .tradingBalance:
                Text("Virtual balance you can use to buy stocks.")
            case .amountBuy:
                Text("The total amount you want to buy.")
            case .priceBuy:
                Text("This is the cost of each share we want to buy.")
            case .lot:
                Text("1 lot = 100 shares")
            case .sellButton:
                Text("Press to sell stock.")
            case .yourAmountOfStock:
                Text("The total amount of this stock that you can sell.")
            case .amountSell:
                Text("The total amount that you will get from the sales.")
            case .priceSell:
                Text("The cost of each share we want to sell.")
        }
    }

    var image: Image? {
        switch self {
            case .stocks:
                Image(systemName: "chart.bar.horizontal.page")
            case .stocksName, .companyProfile:
                Image(systemName: "building.2")
            case .stocksPrice, .amountBuy, .priceBuy, .amountSell, .priceSell:
                Image(systemName: "dollarsign")
            case .gainLoss, .profitLoss:
                Image(systemName: "arrow.up.arrow.down")
            case .yourInvestment, .yourEquity, .tradingBalance, .lot, .sellButton, .yourAmountOfStock:
                Image(systemName: "creditcard")
            case .buyButton:
                Image(systemName: "cart")
        }
    }

}


