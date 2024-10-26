//
//  Placeholder-Tipkit.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 26/10/24.
//

import TipKit

struct Module05StocksTip: Tip {
    var title: Text {
        Text("Stocks")
    }
    
    var message: Text? {
        Text("Option of stocks that you can buy.")
    }
    
    var image: Image? {
        Image(systemName: "chart.bar.horizontal.page")
    }
}

struct Module05StocksNameTip: Tip {
    var title: Text {
        Text("Stocks Name")
    }
    
    var message: Text? {
        Text("The full name of the stock.")
    }
    
    var asset: Image? {
        Image(systemName: "building.2")
    }
}

struct Module05StocksPriceTip: Tip {
    var title: Text {
        Text("Stocks Price")
    }
    
    var message: Text? {
        Text("The price of the stock for each share.")
    }
    
    var asset: Image? {
        Image(systemName: "dollarsign")
    }
}

struct Module05GainLossTip: Tip {
    var title: Text {
        Text("Gain/Loss")
    }
    
    var message: Text? {
        Text("The gain or loss of a share from the last price before market close.")
    }
    
    var asset: Image? {
        Image(systemName: "arrow.up.arrow.down")
    }
}

struct Module05YourInvestmentTip: Tip {
    var title: Text {
        Text("Your Investment")
    }
    
    var message: Text? {
        Text("The amount that you invest in this stocks.")
    }
    
    var asset: Image? {
        Image(systemName: "creditcard")
    }
}

struct Module05YourEquityTip: Tip {
    var title: Text {
        Text("Your Equity")
    }
    
    var message: Text? {
        Text("It's your equity in this stock.")
    }
    
    var asset: Image? {
        Image(systemName: "creditcard")
    }
}

struct Module05ProfitLossTip: Tip {
    var title: Text {
        Text("Profit/Loss")
    }
    
    var message: Text? {
        Text("The amount you get or loss from this stock based on the price you buy.")
    }
    
    var asset: Image? {
        Image(systemName: "arrow.up.arrow.down")
    }
}

struct Module05CompanyProfileTip: Tip {
    var title: Text {
        Text("Company Profile")
    }
    
    var message: Text? {
        Text("You can analysis their company with their profile.")
    }
    
    var asset: Image? {
        Image(systemName: "building.2")
    }
}

struct Module05BuyButtonTip: Tip {
    var title: Text {
        Text("Buy Button")
    }
    
    var message: Text? {
        Text("Press to buy stocks.")
    }
    
    var asset: Image? {
        Image(systemName: "cart")
    }
}

struct Module05TradingBalanceTip: Tip {
    var title: Text {
        Text("Trading Balance")
    }
    
    var message: Text? {
        Text("Virtual balance you can use to buy stocks.")
    }
    
    var asset: Image? {
        Image(systemName: "creditcard")
    }
}

struct Module05AmountBuyTip: Tip {
    var title: Text {
        Text("Amount")
    }
    
    var message: Text? {
        Text("The total amount you want to buy.")
    }
    
    var asset: Image? {
        Image(systemName: "dollarsign")
    }
}

struct Module05PriceBuyTip: Tip {
    var title: Text {
        Text("Price")
    }
    
    var message: Text? {
        Text("This is the cost of each share we want to buy.")
    }
    
    var asset: Image? {
        Image(systemName: "dollarsign")
    }
}

struct Module05LotTip: Tip {
    var title: Text {
        Text("Lot")
    }
    
    var message: Text? {
        Text("1 lot = 100 shares")
    }
    
    var asset: Image? {
        Image(systemName: "creditcard")
    }
}

struct Module05SellButtonTip: Tip {
    var title: Text {
        Text("Sell Button")
    }
    
    var message: Text? {
        Text("Press to sell stock.")
    }
    
    var asset: Image? {
        Image(systemName: "creditcard")
    }
}

struct Module05YourAmountOfStockTip: Tip {
    var title: Text {
        Text("Your Amount Of Stock")
    }
    
    var message: Text? {
        Text("The total amount of this stock that you can sell.")
    }
    
    var asset: Image? {
        Image(systemName: "creditcard")
    }
}

struct Module05AmountSellTip: Tip {
    var title: Text {
        Text("Amount")
    }
    
    var message: Text? {
        Text("The total amount that you will get from the sales.")
    }
    
    var asset: Image? {
        Image(systemName: "dollarsign")
    }
}

struct Module05PriceSellTip: Tip {
    var title: Text {
        Text("Price")
    }
    
    var message: Text? {
        Text("The cost of each share we want to sell.")
    }
    
    var asset: Image? {
        Image(systemName: "dollarsign")
    }
}

