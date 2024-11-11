//
//  ProductPriceSchema.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 21/10/24.
//

import Foundation
import SwiftData

@Model final class ProductPriceSchema {
    @Attribute(.unique) var priceID: String
    var name: String
    var price: Int
    var time: Date
    
    init(id: String, name: String, price: Int, time: Date) {
        self.priceID = id
        self.name = name
        self.price = price
        self.time = time
    }
    
    func update(priceID: String) {
        self.priceID = priceID
    }
    
    func update(name: String) {
        self.name = name
    }
    
    func update(price: Int) {
        self.price = price
    }
    
    func update(time: Date) {
        self.time = time
    }
    
    func mapToEntity() -> ProductPriceEntity {
        return ProductPriceEntity(
            id: self.priceID,
            name: self.name,
            price: self.price,
            time: self.time
        )
    }
}
