//
//  HanvestSimulationViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 23/10/24.
//

import Foundation

class HanvestSimulationViewModel: ObservableObject, HanvestSimulatable {
    @Published var stockList: [StockEntity] {
        didSet {
            updateSelectedStock()
        }
    }
    
    @Published var selectedStockID: String {
        didSet {
            updateSelectedStock()
        }
    }
    
    @Published var selectedStock: StockEntity? {
        didSet {
            self.displayActiveStockInitialPrice = selectedStock?.stockPrice.first?.price ?? 0
            self.displayActiveStockCurrentPrice = selectedStock?.stockPrice.last?.price ?? 0
        }
    }
    
    @Published var displayActiveStockInitialPrice: Int
    
    @Published var displayActiveStockCurrentPrice: Int
    
    init(
        stockList: [StockEntity] = [],
        selectedStockID: String = "",
        selectedStock: StockEntity? = nil,
        displayActiveStockInitialPrice: Int = 0,
        displayActiveStockCurrentPrice: Int = 0
    ) {
        self.stockList = stockList
        self.selectedStockID = selectedStockID
        self.selectedStock = selectedStock
        self.displayActiveStockInitialPrice = displayActiveStockInitialPrice
        self.displayActiveStockCurrentPrice = displayActiveStockCurrentPrice
    }
    
    func setup(){
        self.selectedStockID = stockList.first?.stockIDName ?? ""
    }
    
    func updateSelectedStock() {
        // Find the stock that matches the selectedStockID, or fallback to the first one
        if let stock = stockList.first(where: { $0.stockIDName == selectedStockID }) {
            self.selectedStock = stock
        }
        else if let firstStock = stockList.first {
            // Fallback to the first stock if no matching stock is found
            debugPrint("[ERROR]: Stock with ID \(selectedStockID) not found. Defaulting to the first stock.")
            self.selectedStock = firstStock
        }
        else {
            // Handle case where stockList is empty
            debugPrint("[ERROR]: No Stock Data in Stock List!")
            self.selectedStock = nil
        }
    }
    
    func getSelectedStockIdx(selectedStockID: String) -> Int {
        guard let stockUpdateIdx = stockList.firstIndex(where: {
            $0.stockIDName == selectedStockID
        }) else { return 0 }
        
        return stockUpdateIdx
    }
    
    func appendNewStockPrice(stockIdx: Int, newStockPrice: ProductPriceEntity) {
        self.stockList[stockIdx].stockPrice.append(newStockPrice)
    }
    
    func updatePriceBasedOn(news: StockNewsEntity) {
        let idx = getSelectedStockIdx(selectedStockID: news.stockIDName)
        
        let currentStockPrice = self.stockList[idx].stockPrice.last?.price ?? 0
        let newStockPrice = currentStockPrice &+ (currentStockPrice &* news.stockFluksPercentage / 100)
        let lastTime = self.stockList[idx].stockPrice.last?.time ?? Date.now
        
        let newPriceEntity = ProductPriceEntity(
            id: self.stockList[idx].stockIDName,
            name: self.stockList[idx].stockIDName,
            price: newStockPrice,
            time: lastTime.addingTimeInterval(30 * 60)
        )
        
        appendNewStockPrice(stockIdx: idx, newStockPrice: newPriceEntity)
    }

}
