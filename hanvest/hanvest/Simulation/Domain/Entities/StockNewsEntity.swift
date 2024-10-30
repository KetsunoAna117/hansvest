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
    var newsReleasedTime: Date
    var newsContent: String
    var stockFluksPercentage: Int
    var hasTriggered: Bool
}

extension StockNewsEntity {
    func mapToSchema() -> StockNewsSchema {
        return StockNewsSchema(
            newsID: self.newsID,
            stockIDName: self.stockIDName,
            newsTitle: self.newsTitle,
            newsReleasedTime: self.newsReleasedTime,
            newsContent: self.newsContent,
            stockFluksPercentage: self.stockFluksPercentage,
            hasTriggered: self.hasTriggered
        )
    }
}
