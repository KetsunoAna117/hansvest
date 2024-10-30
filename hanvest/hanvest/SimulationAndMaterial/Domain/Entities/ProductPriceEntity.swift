//
//  SimulationStockPriceEntity.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import Foundation

struct ProductPriceEntity: Equatable {
    var id: String
    var name: String
    var price: Int
    var time: Date
    
    static func == (lhs: ProductPriceEntity, rhs: ProductPriceEntity) -> Bool {
        return
            lhs.price == rhs.price &&
            lhs.time == rhs.time
    }
    
    func mapToSchema() -> ProductPriceSchema {
        return ProductPriceSchema(
            id: self.id,
            name: self.name,
            price: self.price,
            time: self.time
        )
    }
}
