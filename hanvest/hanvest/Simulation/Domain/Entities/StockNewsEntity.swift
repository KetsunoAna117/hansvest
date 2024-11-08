//
//  StockNewsEntity.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 17/10/24.
//

import Foundation

struct StockNewsEntity {
    var newsID: String
    var stockIDName: String
    var newsTitle: String
    var newsContent: String
    var stockFluksPercentage: Int
}

extension StockNewsEntity {
    func mapToSchema() -> StockNewsSchema {
        return StockNewsSchema(
            newsID: self.newsID,
            stockIDName: self.stockIDName,
            newsTitle: self.newsTitle,
            newsContent: self.newsContent,
            stockFluksPercentage: self.stockFluksPercentage
        )
    }
}
