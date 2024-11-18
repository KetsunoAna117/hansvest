//
//  GetStockNewsData.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 17/10/24.
//

import Foundation

protocol UpdateStockPriceByNews {
    func execute(stockList: inout [StockEntity], news: StockNewsEntity) -> Result<Bool, Error>
}

struct UpdateStockPriceByNewsImpl: UpdateStockPriceByNews {
    let stockPriceRepo: ProductPriceRepository
    
    func execute(stockList: inout [StockEntity], news: StockNewsEntity) -> Result<Bool, Error> {
        let index = stockList.firstIndex { stock in
            stock.stockIDName == news.stockIDName
        }
        
        guard let index = index else {
            return .failure(SwiftDataError.notFound("Stock with ID \(news.stockIDName) is not found"))
        }
        
        guard let stockLastPriceEntity = stockList[index].stockPrice.last else {
            return .failure(SwiftDataError.notFound("No Initial Stock Price for \(stockList[index].stockIDName) Detected"))
        }
        
        // Calculate New price
        let newPrice = stockLastPriceEntity.price &+ (stockLastPriceEntity.price &* news.stockFluksPercentage / 100)
        let newDate = stockLastPriceEntity.time.addingTimeInterval(30 * 60)
    
        let newPriceEntity = ProductPriceEntity(
            id: UUID().uuidString,
            name: stockList[index].stockIDName,
            price: newPrice,
            time: newDate
        )
        
        do {
            // Delete the data if there's already too much price data
            let count = stockPriceRepo.fetchCount(stockID: news.stockIDName)
            
            if count >= 20 {
                guard let firstPriceData = stockList[index].stockPrice.first else {
                    return .failure(SwiftDataError.notFound("First Stock Price from \(stockList[index]) is not detected"))
                }
                try stockPriceRepo.delete(id: firstPriceData.id)
            }
            
            // Save new price to database
            try stockPriceRepo.save(newPriceEntity.mapToSchema())
            
            // Update stock data
            let updatedStockPriceData = stockPriceRepo.fetchAllWith(stockID: news.stockIDName)
            if updatedStockPriceData.count > 0 {
                stockList[index].stockPrice = updatedStockPriceData.map {
                    $0.mapToEntity()
                }
            }
        }
        catch {
            return .failure(error)
        }

        return .success(true)
    }
}
