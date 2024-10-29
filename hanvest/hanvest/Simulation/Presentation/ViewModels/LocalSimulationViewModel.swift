//
//  LocalSimulationViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 23/10/24.
//

import Foundation
import SwiftUI

class LocalSimulationViewModel: HanvestSimulationViewModel {
    @Inject var getStockList: GetAvailableSimulationStocks
    
    var timer: Timer?
    var appRouter: (any AppRouterProtocol)?
    
    func setup(appRouter: any AppRouterProtocol) {
        super.setup()
        self.stockList = getStockList.execute()
        self.selectedStockID = stockList.first?.stockIDName ?? ""
        self.appRouter = appRouter
        simulatePrice()
    }
}

extension LocalSimulationViewModel {
    func simulatePrice(){
        print("[TEST] Timer to Update Stock Price Started!")
        if timer != nil {
            timer = nil
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { timer in
            //            self.addPriceUsingRandom()
            self.displayNotification()
            
        }
    }
    
    private func displayNotification(){
        print("[!] Event Trigger Notification")
        if let appRouter = appRouter {
            withAnimation(.easeInOut(duration: 0.5)) {
                appRouter.presentNotification(
                    .notification(
                        news:
                            .init(
                                newsID: UUID().uuidString,
                                stockIDName: "GOTO",
                                newsTitle: "GOTO gets billions in funding",
                                newsReleasedTime: Date(timeInterval: -10, since: Date.now),
                                newsContent:
                                            """
                                            In a recent report released today, Chinese tech giant Alibaba is said to have injected billions of rupiah into Gojek Tokopedia (GOTO). This investment is seen as part of Alibaba’s strategy to expand its business reach in Southeast Asia, particularly in Indonesia.
                                            
                                            Alibaba's move is viewed as an effort to strengthen GOTO’s ecosystem, which spans e-commerce, on-demand services, including transportation, food delivery, and online shopping platforms that are increasingly dominating the domestic market.
                                            
                                            The Chinese company is no stranger to Southeast Asia, having previously made significant investments in Lazada. With this new capital infusion, GOTO is expected to accelerate its growth and better compete against other global tech giants.
                                            
                                            Neither GOTO nor Alibaba has provided an official comment on the report, but analysts predict that this investment will further solidify GOTO’s position as a key player in Indonesia’s digital economy.
                                            
                                            """,
                                stockFluksPercentage: 10,
                                hasTriggered: true
                        )
                    )
                )
            }
        }
    }
    
    private func addPriceUsingRandom(){
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
