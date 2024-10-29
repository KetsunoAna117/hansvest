//
//  SimulationStockEntity.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import Foundation
import SwiftUI

struct SimulationStockEntity: Equatable {
    var stockIDName: String
    var stockName: String
    var stockImageName: String
    var stockDescription: String
    var stockPrice: [ProductPriceEntity]
    
    static func == (lhs: SimulationStockEntity, rhs: SimulationStockEntity) -> Bool {
        return
            lhs.stockIDName == rhs.stockIDName &&
            lhs.stockName == rhs.stockName &&
            lhs.stockImageName == rhs.stockImageName &&
            lhs.stockDescription == rhs.stockDescription &&
            lhs.stockPrice == rhs.stockPrice
    }
}

extension SimulationStockEntity {
    func mapToSchema() -> SimulationStockSchema {
        return SimulationStockSchema(
            stockIDName: self.stockIDName,
            stockName: self.stockName,
            stockImageName: self.stockImageName,
            stockDescription: self.stockDescription,
            stockPriceID: self.stockPrice.map({ $0.id })
        )
    }
}
