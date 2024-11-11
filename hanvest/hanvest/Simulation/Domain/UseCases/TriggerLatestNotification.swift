//
//  GetLatestNotification.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 11/11/24.
//

protocol TriggerLatestNotification {
    func execute(user: UserDataEntity) -> Result<UserNotificationEntity?, Error>
}

struct TriggerLatestNotificationImpl: TriggerLatestNotification {
    let notificationRepo: UserNotificationRepository
    
    func execute(user: UserDataEntity) -> Result<UserNotificationEntity?, Error> {
        // Validate if there's a notification
        guard let latestNotification = user.notificationList.last else {
            return .success(nil)
        }
        
        // Validate if latest notification has triggered
        guard latestNotification.hasTriggered == false else {
            return .success(nil)
        }
        
        // Update
        do {
            try notificationRepo.update(
                notificationID: latestNotification.notificationID,
                hasTriggered: true
            )
            return .success(latestNotification)
        }
        catch {
            return .failure(error)
        }
    }
}
