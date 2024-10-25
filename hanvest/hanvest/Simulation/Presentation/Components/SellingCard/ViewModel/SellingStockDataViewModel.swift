//
//  SellingStockDataViewModel.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 15/10/24.
//

import SwiftUI

class SellingStockDataViewModel: ObservableObject{
    // Dependency Injection
    @Inject var getPurchasedLot: GetUserTransaction
    
    var selectedStockIDName: String
    var stockSellFee: Int
    
    @Published var availableLot: Int {
        didSet {
            validateStockSellAmount()
        }
    }
    @Published var toSellStockPrice: Int{
        didSet {
            validateStockSellAmount()
        }
    }
    @Published var stockSellLot: Int{
        didSet {
            validateStockSellAmount()
        }
    }
    
    @Published var stockSellAmount: Int
    @Published var initialStockPrice: Int
    @Published var currentStockPrice: Int
    
    init() {
        self.selectedStockIDName = ""
        self.stockSellFee = 500
        self.availableLot = 0
        self.toSellStockPrice = 0
        self.stockSellLot = 0
        self.stockSellAmount = 0
        self.initialStockPrice = 0
        self.currentStockPrice = 0
    }
    
    func setup(
        selectedStockIDName: String,
        stockSellLot: Int = 0,
        initialStockPrice: Int,
        currentStockPrice: Int
    ){
        self.selectedStockIDName = selectedStockIDName
        self.availableLot = calculateOwnedLot(selectedStockIDName: selectedStockIDName)
        self.toSellStockPrice = currentStockPrice
        self.stockSellLot = stockSellLot
        
        self.initialStockPrice = initialStockPrice
        self.currentStockPrice = currentStockPrice
        validateStockSellAmount()
    }
    
    private func calculateOwnedLot(selectedStockIDName: String) -> Int {
        var lotCount = 0
        let purchasedLot = getPurchasedLot.execute(stockIDName: selectedStockIDName)
        
        for data in purchasedLot {
            lotCount += data.stockLotQuantity
        }
        
        return lotCount
    }
    
    func validateStockSellAmount() {
        validateStockPrice()
        validateStockSellLot()
        calculateStockSellAmount()
    }
    
    func calculateStockSellAmount(){
        stockSellAmount = toSellStockPrice * stockSellLot * 100
    }
    
    private func validateStockPrice() {
        if toSellStockPrice < 0 {
            toSellStockPrice = 0
        }
    }
    
    private func validateStockSellLot() {
        if stockSellLot < 0 {
            stockSellLot = 0
        }
    }
    
    func maximumStockSellLot() -> Int {
        let maxLot = availableLot
        return maxLot
    }
    
    func calculateStockSellAmountPercentage() -> String {
        var percentage: Double = 0
        
        if availableLot == 0 {
            percentage = 0
        } else{
            percentage = Double(stockSellLot) / Double(availableLot) * 100
        }
        return String(format: "%.2f", percentage)
    }
    
    func determineAmountState() -> HanvestSellingCardDefaultState{
        if stockSellLot <= availableLot {
            return .Affordable
        } else {
            return .Exceeded
        }
    }
    
    func determineIsDisabledButtonState() -> Bool {
        if stockSellLot <= availableLot && stockSellAmount > 0 {
            return false
        } else {
            return true
        }
    }
    
}

