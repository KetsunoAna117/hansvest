//
//  HanvestError.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 11/11/24.
//

import Foundation

enum NotificationError: Error {
    case noNotificationsAvailable
    case notificationAlreadyTriggered
    case genericError(_ error: Error)
}
