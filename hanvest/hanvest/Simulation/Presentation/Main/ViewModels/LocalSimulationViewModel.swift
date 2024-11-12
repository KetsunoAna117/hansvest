//
//  LocalSimulationViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 23/10/24.
//

import Foundation
import SwiftUI

class LocalSimulationViewModel: HanvestSimulationViewModel {
    // CONSTANT
    #if DEBUG
    let TIMER_PRICE_UPDATE_INTERVAL: Double = 10
    #else
    let TIMER_PRICE_UPDATE_INTERVAL: Double = 45
    #endif
    
    @Inject var getStockList: GetAvailableSimulationStocks
    @Inject var updateStockPriceByNews: UpdateStockPriceByNews
    @Inject var sendStockPriceUpdateNotification: SendStockPriceUpdateNotification
    @Inject var triggerLatestNotification: TriggerLatestNotification
    
    var timer: Timer?
    var appRouter: (any AppRouterProtocol)?
    
    func setup(
        appRouter: any AppRouterProtocol,
        loadedUserViewModel: HanvestLoadedUserDataViewModel
    ) {
        super.setup()
        self.stockList = getStockList.execute()
        self.selectedStockID = stockList.first?.stockIDName ?? ""
        self.appRouter = appRouter
        simulatePrice(loadedUserViewModel: loadedUserViewModel)
    }
}

extension LocalSimulationViewModel {
    func simulatePrice(loadedUserViewModel: HanvestLoadedUserDataViewModel){
        // User timer to schedule stock price changing
        timer = Timer.scheduledTimer(withTimeInterval: TIMER_PRICE_UPDATE_INTERVAL, repeats: true) { timer in
            guard let userData = loadedUserViewModel.userData else {
                debugPrint("ERROR: User Data is not found")
                return
            }
            
            // Check if latest notification has been triggered or not
            let isNotificationTriggered = self.triggerLatestNotification.execute(user: userData)
            switch isNotificationTriggered {
                case .success(let notification):
                    // If latest notification is not triggered, trigger first
                    if let notification = notification {
                        self.updateStockPrice(notification: notification)
                    }
                case .failure(let failure):
                    debugPrint(failure)
            }
            
            // Push Notification to user
            self.sendNotification(loadedUserViewModel: loadedUserViewModel)
        }
    }
    
    private func sendNotification(loadedUserViewModel: HanvestLoadedUserDataViewModel){
        // Validate UserID
        guard let user = loadedUserViewModel.userData else {
            debugPrint("ERROR: User Data is Not Detected")
            return
        }
        
        // Send Notification to the user
        let notificationResult = sendStockPriceUpdateNotification.execute(user: user)
        loadedUserViewModel.setup()
        
        switch notificationResult {
            case .success(let notification):
                // If user receive the notification, display it
                displayNotification(notification: notification)
            case .failure(let failure):
                debugPrint("ERROR: \(failure.localizedDescription)")
        }
    }
    
    // Function to update Stock Price from Stock List
    private func updateStockPrice(notification: UserNotificationEntity){
        let result = self.updateStockPriceByNews.execute(stockList: &self.stockList, news: notification.stockNews)
        
        switch result {
        case .success(_):
            debugPrint("[!] Update Stock price for \(notification.stockNews.stockIDName)")
        case .failure(let failure):
            debugPrint("ERROR: \(failure)")
        }
    }
    
    // Function to display notification animation in the app
    private func displayNotification(notification: UserNotificationEntity){
        if let appRouter = appRouter {
            appRouter.presentNotification(
                .notification(notification: notification)
            )
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
        debugPrint("[TEST] New Price for \(self.stockList[randomStockIncrease].stockIDName) with new price: \(self.stockList[randomStockIncrease].stockPrice.last?.price ?? 0)")
    }
    
    func deactivateTimer(){
        debugPrint("[TEST]: Timer Deactivated")
        self.timer?.invalidate()
        self.timer = nil
    }
    
    func updateSelectedPrice(idx: Int){
        self.displayActiveStockInitialPrice = self.stockList[idx].stockPrice.first?.price ?? 0
        self.displayActiveStockCurrentPrice = self.stockList[idx].stockPrice.last?.price ?? 0
    }
}
