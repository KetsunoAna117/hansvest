//
//  Module01StockEntity.swift
//  hanvest
//
//  Created by Bryan Vernanda on 17/10/24.
//

import Foundation

struct ProductOfInvestmentEntity: Equatable {
    var productName: String
    var productPrices: [ProductPriceEntity]
    
    static func == (lhs: ProductOfInvestmentEntity, rhs: ProductOfInvestmentEntity) -> Bool {
        return
            lhs.productName == rhs.productName &&
            lhs.productPrices == rhs.productPrices
    }
    
    static func getMockData() -> [[ProductOfInvestmentEntity]] {
        return [
            [
                ProductOfInvestmentEntity(
                    productName: "Deposito",
                    productPrices: [
                        ProductPriceEntity(id: UUID().uuidString, name: "Deposito", price: 10000000, time: HanvestDateFormatter.stringToDate("2024-10-11 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Deposito", price: 10004000, time: HanvestDateFormatter.stringToDate("2024-10-26 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Deposito", price: 10008000, time: HanvestDateFormatter.stringToDate("2024-11-10 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Deposito", price: 10010000, time: HanvestDateFormatter.stringToDate("2024-11-25 00:00:00"))
                    ]
                ),
                ProductOfInvestmentEntity(
                    productName: "Government Bonds",
                    productPrices: [
                        ProductPriceEntity(id: UUID().uuidString, name: "Government Bonds", price: 10000000, time: HanvestDateFormatter.stringToDate("2024-10-11 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Government Bonds", price: 9985000, time: HanvestDateFormatter.stringToDate("2024-10-26 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Government Bonds", price: 9700000, time: HanvestDateFormatter.stringToDate("2024-11-10 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Government Bonds", price: 9960000, time: HanvestDateFormatter.stringToDate("2024-11-25 00:00:00"))
                    ]
                ),
                ProductOfInvestmentEntity(
                    productName: "Stocks",
                    productPrices: [
                        ProductPriceEntity(id: UUID().uuidString, name: "Stocks", price: 10000000, time: HanvestDateFormatter.stringToDate("2024-10-11 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Stocks", price: 9333334, time: HanvestDateFormatter.stringToDate("2024-10-26 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Stocks", price: 8666668, time: HanvestDateFormatter.stringToDate("2024-11-10 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Stocks", price: 8000000, time: HanvestDateFormatter.stringToDate("2024-11-25 00:00:00"))
                    ]
                )
            ],
            
            [
                ProductOfInvestmentEntity(
                    productName: "Deposito",
                    productPrices: [
                        ProductPriceEntity(id: UUID().uuidString, name: "Deposito", price: 10000000, time: HanvestDateFormatter.stringToDate("2024-10-11 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Deposito", price: 10004000, time: HanvestDateFormatter.stringToDate("2024-10-26 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Deposito", price: 10008000, time: HanvestDateFormatter.stringToDate("2024-11-10 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Deposito", price: 10010000, time: HanvestDateFormatter.stringToDate("2024-11-25 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Deposito", price: 10020000, time: HanvestDateFormatter.stringToDate("2024-12-10 00:00:00"))
                    ]
                ),
                ProductOfInvestmentEntity(
                    productName: "Government Bonds",
                    productPrices: [
                        ProductPriceEntity(id: UUID().uuidString, name: "Government Bonds", price: 10000000, time: HanvestDateFormatter.stringToDate("2024-10-11 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Government Bonds", price: 9985000, time: HanvestDateFormatter.stringToDate("2024-10-26 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Government Bonds", price: 9700000, time: HanvestDateFormatter.stringToDate("2024-11-10 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Government Bonds", price: 9960000, time: HanvestDateFormatter.stringToDate("2024-11-25 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Government Bonds", price: 10140000, time: HanvestDateFormatter.stringToDate("2024-12-10 00:00:00"))
                    ]
                ),
                ProductOfInvestmentEntity(
                    productName: "Stocks",
                    productPrices: [
                        ProductPriceEntity(id: UUID().uuidString, name: "Stocks", price: 10000000, time: HanvestDateFormatter.stringToDate("2024-10-11 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Stocks", price: 9333334, time: HanvestDateFormatter.stringToDate("2024-10-26 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Stocks", price: 8666668, time: HanvestDateFormatter.stringToDate("2024-11-10 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Stocks", price: 8000000, time: HanvestDateFormatter.stringToDate("2024-11-25 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Stocks", price: 14000000, time: HanvestDateFormatter.stringToDate("2024-12-10 00:00:00"))
                    ]
                )
            ],
            
            [
                ProductOfInvestmentEntity(
                    productName: "Deposito",
                    productPrices: [
                        ProductPriceEntity(id: UUID().uuidString, name: "Deposito", price: 10000000, time: HanvestDateFormatter.stringToDate("2024-10-11 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Deposito", price: 10004000, time: HanvestDateFormatter.stringToDate("2024-10-26 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Deposito", price: 10008000, time: HanvestDateFormatter.stringToDate("2024-11-10 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Deposito", price: 10010000, time: HanvestDateFormatter.stringToDate("2024-11-25 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Deposito", price: 10020000, time: HanvestDateFormatter.stringToDate("2024-12-10 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Deposito", price: 10030000, time: HanvestDateFormatter.stringToDate("2024-12-31 00:00:00"))
                    ]
                ),
                ProductOfInvestmentEntity(
                    productName: "Government Bonds",
                    productPrices: [
                        ProductPriceEntity(id: UUID().uuidString, name: "Government Bonds", price: 10000000, time: HanvestDateFormatter.stringToDate("2024-10-11 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Government Bonds", price: 9985000, time: HanvestDateFormatter.stringToDate("2024-10-26 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Government Bonds", price: 9700000, time: HanvestDateFormatter.stringToDate("2024-11-10 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Government Bonds", price: 9960000, time: HanvestDateFormatter.stringToDate("2024-11-25 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Government Bonds", price: 10140000, time: HanvestDateFormatter.stringToDate("2024-12-10 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Government Bonds", price: 10240000, time: HanvestDateFormatter.stringToDate("2024-12-31 00:00:00"))
                    ]
                ),
                ProductOfInvestmentEntity(
                    productName: "Stocks",
                    productPrices: [
                        ProductPriceEntity(id: UUID().uuidString, name: "Stocks", price: 10000000, time: HanvestDateFormatter.stringToDate("2024-10-11 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Stocks", price: 9333334, time: HanvestDateFormatter.stringToDate("2024-10-26 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Stocks", price: 8666668, time: HanvestDateFormatter.stringToDate("2024-11-10 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Stocks", price: 8000000, time: HanvestDateFormatter.stringToDate("2024-11-25 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Stocks", price: 14000000, time: HanvestDateFormatter.stringToDate("2024-12-10 00:00:00")),
                        ProductPriceEntity(id: UUID().uuidString, name: "Stocks", price: 12000000, time: HanvestDateFormatter.stringToDate("2024-12-31 00:00:00"))
                    ]
                )
            ]
            
        ]
    }
}
