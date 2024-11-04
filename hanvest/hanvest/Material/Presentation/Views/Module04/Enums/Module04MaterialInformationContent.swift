//
//  Module04MaterialInformationContent.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

enum Module04MaterialInformationContent: Int, CaseIterable {
    case page01 = 0
    case page03 = 2
    case page05 = 4
    case page07 = 6
    
    var title: String {
        switch self {
            case .page01:
                "What are stocks, stock invest, and capital market?"
            case .page03:
                "Explanation about stocks"
            case .page05:
                "Explanation about market that allow company to sell equity"
            case .page07:
                "Explanation about role of capital market in the economy"
        }
    }
    
    var detailText: Text {
        switch self {
            case .page01:
                Text("Stocks represent a portion of ownership in a company. When you buy them, you own a small part of the business and may earn dividends or profit if the stock's price increases. Investing in stocks means buying shares with the expectation that their value will rise. The capital market is where these stocks and other financial assets are traded, allowing companies to raise money for growth while giving investors the opportunity to earn returns.\n\n").font(.nunito(.body)) +
                Text("Reference").font(.nunito(.body, .bold)) +
                Text(": Graham, B., & Zweig, J. (2006)").font(.nunito(.body))
            case .page03:
                Text("Stocks represent ownership in a company. When someone purchases stock, they acquire a small percentage of the company, entitling them to dividends and the potential appreciation of the stock's value. Options A and B refer to bonds, while option D describes mutual funds, not stocks.").font(.nunito(.body))
            case .page05:
                Text("Mutual funds pool money from many investors to purchase a diversified portfolio of assets, including stocks and bonds. This allows investors to access a broader range of investments than they could individually.").font(.nunito(.body))
            case .page07:
                Text("Capital markets enable companies to raise funds by issuing stocks and bonds, which allows for growth, expansion, and innovation. This process benefits the economy by increasing productivity and creating jobs.").font(.nunito(.body))
        }
    }
    
    var image: Image {
        switch self {
            case .page01, .page03:
                Image("stock-chart-cartoon")
            case .page05:
                Image("investment-plan-cartoon")
            case .page07:
                Image("money-trades-cartoon")
        }
    }
}
