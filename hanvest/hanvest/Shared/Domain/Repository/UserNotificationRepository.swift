//
//  UserNotificationRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 08/11/24.
//

import Foundation

protocol UserNotificationRepository {
    func fetch(id: String) -> UserNotificationSchema?
    func fetchBy(userID: String) -> [UserNotificationSchema]
    func fetchCount(userID: String) -> Int
    func fetchBy(stockNewsID: String) -> [UserNotificationSchema]
    func update(notificationID: String, hasTriggered: Bool) throws -> Void
    func save(_ notification: UserNotificationSchema) throws -> Void
    func delete(_ notificationID: String) throws -> Void
}
