//
//  StockEntity.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import Foundation
import SwiftUI

struct StockEntity: Equatable {
    var stockIDName: String
    var stockName: String
    var stockImageName: String
    var stockDescription: String
    var stockPrice: [ProductPriceEntity]
    
    static func == (lhs: StockEntity, rhs: StockEntity) -> Bool {
        return
            lhs.stockIDName == rhs.stockIDName &&
            lhs.stockName == rhs.stockName &&
            lhs.stockImageName == rhs.stockImageName &&
            lhs.stockDescription == rhs.stockDescription &&
            lhs.stockPrice == rhs.stockPrice
    }
}

extension StockEntity {
    func mapToSchema() -> StockSchema {
        return StockSchema(
            stockIDName: self.stockIDName,
            stockName: self.stockName,
            stockImageName: self.stockImageName,
            stockDescription: self.stockDescription
        )
    }
}
