//
//  Notification.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 28/10/24.
//

enum HanvestNotification: Identifiable, Hashable, Equatable {
    case notification(notification: UserNotificationEntity)
    
    var id: Self { return self }
}

extension HanvestNotification {
    // Conform to Hashable
    func hash(into hasher: inout Hasher) {
        switch self {
        case .notification:
            return hasher.combine(self)
        }
    }
    
    // Conform to Equatable
    static func == (lhs: HanvestNotification, rhs: HanvestNotification) -> Bool {
        switch (lhs, rhs) {
        case (.notification, .notification):
            return true
        }
    }
}
