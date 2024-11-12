//
//  UserNotificationEntity.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 08/11/24.
//

import Foundation

struct UserNotificationEntity {
    var notificationID: String
    var releasedTime: Date
    var hasTriggered: Bool
    var stockNews: StockNewsEntity
}

extension UserNotificationEntity {
    func mapToSchema(
        userID: String
    ) -> UserNotificationSchema {
        return .init(
            notificationID: self.notificationID,
            releasedTime: self.releasedTime,
            hasTriggered: self.hasTriggered,
            userID: userID,
            stockNewsID: stockNews.newsID
        )
    }
}
