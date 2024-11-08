//
//  UserNotificationSchema.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 08/11/24.
//

import Foundation
import SwiftData

@Model final class UserNotificationSchema {
    @Attribute(.unique) var notificationID: String
    var releasedTime: Date
    var hasTriggered: Bool
    var userID: String // Foreign Key
    var stockNewsID: String // Foreign Key
    
    init(notificationID: String, releasedTime: Date, hasTriggered: Bool, userID: String, stockNewsID: String) {
        self.notificationID = notificationID
        self.releasedTime = releasedTime
        self.hasTriggered = hasTriggered
        self.userID = userID
        self.stockNewsID = stockNewsID
    }
    
    func mapToEntity(
        stockNews: StockNewsSchema
    ) -> UserNotificationEntity {
        return .init(
            notificationID: self.notificationID,
            releasedTime: self.releasedTime,
            hasTriggered: self.hasTriggered,
            stockNews: stockNews.mapToEntity()
        )
    }
}
