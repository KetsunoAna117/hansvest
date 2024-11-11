//
//  GetRandomNews.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 11/11/24.
//

import Foundation

protocol SendStockPriceUpdateNotification {
    func execute(userID: String) -> Result<UserNotificationEntity, Error>
}

struct SendStockPriceUpdateNotificationImpl: SendStockPriceUpdateNotification {
    let newsRepo: StockNewsRepository
    let userNotificationRepo: UserNotificationRepository
    
    func execute(userID: String) -> Result<UserNotificationEntity, any Error> {
        guard let news = newsRepo.fetchRandom() else {
            return .failure(SwiftDataError.noData("News Data is not found"))
        }
        
        // Send Notification to user
        let userNotification = UserNotificationEntity(
            notificationID: UUID().uuidString,
            releasedTime: Date.now,
            hasTriggered: false,
            stockNews: news.mapToEntity()
        )
        
        do {
            try userNotificationRepo.save(userNotification.mapToSchema(userID: userID))
        }
        catch {
            return .failure(error)
        }
        
        return .success(userNotification)
    }
    
}
