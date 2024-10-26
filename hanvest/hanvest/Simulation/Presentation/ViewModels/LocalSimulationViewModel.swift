//
//  LocalSimulationViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 23/10/24.
//

import Foundation

class LocalSimulationViewModel: HanvestSimulationViewModel {
    @Inject var getStockList: GetAvailableSimulationStocks
    
    var timer: Timer?
    
    override func setup(){
        self.stockList = getStockList.execute()
        self.selectedStockID = stockList.first?.stockIDName ?? ""
        simulatePrice()
    }
}

extension LocalSimulationViewModel {
    func simulatePrice(){
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
}
