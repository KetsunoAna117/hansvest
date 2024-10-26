//
//  HanvestSimulationViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 23/10/24.
//

import Foundation

class HanvestSimulationViewModel: ObservableObject, HanvestSimulatable {
    @Published var stockList: [SimulationStockEntity] {
        didSet {
            updateSelectedStock()
        }
    }
    
    @Published var selectedStockID: String {
        didSet {
            updateSelectedStock()
        }
    }
    
    @Published var selectedStock: SimulationStockEntity? {
        didSet {
            self.displayActiveStockInitialPrice = selectedStock?.stockPrice.first?.price ?? 0
            self.displayActiveStockCurrentPrice = selectedStock?.stockPrice.last?.price ?? 0
        }
    }
    
    @Published var displayActiveStockInitialPrice: Int
    
    @Published var displayActiveStockCurrentPrice: Int
    
    init(
        stockList: [SimulationStockEntity] = [],
        selectedStockID: String = "",
        selectedStock: SimulationStockEntity? = nil,
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
            print("[ERROR]: Stock with ID \(selectedStockID) not found. Defaulting to the first stock.")
            self.selectedStock = firstStock
        }
        else {
            // Handle case where stockList is empty
            print("[ERROR]: No Stock Data in Stock List!")
            self.selectedStock = nil
        }
    }
    
    func getSelectedStockIdx(selectedStockID: String) -> Int {
        guard let stockUpdateIdx = stockList.firstIndex(where: {
            $0.stockIDName == selectedStockID
        }) else { return 0 }
        
        return stockUpdateIdx
    }

}
