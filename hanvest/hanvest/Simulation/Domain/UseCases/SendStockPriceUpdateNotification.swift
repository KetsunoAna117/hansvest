//
//  GetRandomNews.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 11/11/24.
//

import Foundation

protocol SendStockPriceUpdateNotification {
    func execute(user: UserDataEntity) -> Result<UserNotificationEntity, Error>
}

struct SendStockPriceUpdateNotificationImpl: SendStockPriceUpdateNotification {
    let newsRepo: StockNewsRepository
    let userNotificationRepo: UserNotificationRepository
    
    func execute(user: UserDataEntity) -> Result<UserNotificationEntity, any Error> {
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
            // Delete oldest notification
            if user.notificationList.count > 10 {
                if let oldestNotification = user.notificationList.last {
                    try userNotificationRepo.delete(oldestNotification.notificationID)
                }
            }
            
            // Create new Notification
            try userNotificationRepo.save(userNotification.mapToSchema(userID: user.userId))
        }
        catch {
            return .failure(error)
        }
        
        return .success(userNotification)
    }
    
}
