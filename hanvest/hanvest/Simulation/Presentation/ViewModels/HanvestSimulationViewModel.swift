//
//  HanvestSimulationViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import Foundation

class HanvestSimulationViewModel: ObservableObject {
    @Inject var getStockList: GetAvailableSimulationStocks
    
    @Published var stockList: [SimulationStockEntity] {
        didSet {
            updateSelectedStock()
            self.displayActiveStockInitialPrice = selectedStock?.stockPrice.first?.price ?? 0
            self.displayActiveStockCurrentPrice = selectedStock?.stockPrice.last?.price ?? 0
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

    var timer: Timer?
    
    init(){
        stockList = []
        selectedStockID = ""
        displayActiveStockInitialPrice = 0
        displayActiveStockCurrentPrice = 0
        testPriceUpdate()
    }
    
    func setup(){
        self.stockList = getStockList.execute()
        self.selectedStockID = stockList.first?.stockIDName ?? ""
    }
    
    func onAppear(){
        self.selectedStockID = stockList.first?.stockIDName ?? ""
    }
    
    func updateSelectedStock() {
        if selectedStock == nil {
            if let stock = stockList.first {
                self.selectedStock = stock
            }
            else {
                print("[ERROR]: No Stock Data in Stock List!")
            }
        }
        else if let stock = stockList.first(where: { $0.stockIDName == selectedStockID }) {
            self.selectedStock = stock
        } else {
            print("[ERROR]: Stock with ID \(selectedStockID) not found.")
            self.selectedStock = nil
        }
    }
    
    func testPriceUpdate(){
        print("[TEST] Timer to Update Stock Price Started!")
        if timer != nil {
            timer = nil
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
            let random = Int.random(in: 1...100)
            let randomPriceIncrease = random % 2 == 0 ? 10 : -5
            
            let randomStockIncrease = Int.random(in: 0...(self.stockList.count - 1))
            
            let currentStockPrice = self.stockList[randomStockIncrease].stockPrice.last?.price ?? 0
            let lastTime = self.stockList[randomStockIncrease].stockPrice.last?.time ?? Date.now
            
            let newPrice = ProductPriceEntity(
                id: self.stockList[randomStockIncrease].stockIDName,
                name: self.stockList[randomStockIncrease].stockIDName,
                price: currentStockPrice + randomPriceIncrease,
                time: lastTime.addingTimeInterval(30 * 60)
            )

            self.stockList[randomStockIncrease].stockPrice.append(newPrice)
            print("[TEST] New Price for \(self.stockList[randomStockIncrease].stockIDName) with new price: \(self.stockList[randomStockIncrease].stockPrice.last?.price ?? 0)")
            
        }
    }
    
    func deactivateTimer(){
        print("[TEST]: Timer Deactivated")
        self.timer?.invalidate()
        self.timer = nil
    }
    
    func updateSelectedPrice(idx: Int){
        self.displayActiveStockInitialPrice = self.stockList[idx].stockPrice.first?.price ?? 0
        self.displayActiveStockCurrentPrice = self.stockList[idx].stockPrice.last?.price ?? 0
    }
    
    private func getSelectedStockIdx(selectedStockID: String) -> Int {
        guard let stockUpdateIdx = stockList.firstIndex(where: {
            $0.stockIDName == selectedStockID
        }) else { return 0 }
        
        return stockUpdateIdx
    }
}

