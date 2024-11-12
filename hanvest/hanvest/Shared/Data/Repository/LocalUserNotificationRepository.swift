//
//  LocalUserNotificationRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 08/11/24.
//

import Foundation
import SwiftData

struct LocalUserNotificationRepository: UserNotificationRepository {
    let modelContext: ModelContext?
    
    func fetch(id: String) -> UserNotificationSchema? {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<UserNotificationSchema>(
                    predicate: #Predicate { $0.notificationID == id}
                )
                let result = try context.fetch(descriptor)
                return result.first
            }
            catch {
                debugPrint("Error Fetching Notification for NotificationID: \(id)")
            }
        }
        
        return nil
    }
    
    func fetchBy(userID: String) -> [UserNotificationSchema] {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<UserNotificationSchema>(
                    predicate: #Predicate { $0.userID == userID},
                    sortBy: [
                        .init(\.releasedTime, order: .reverse)
                    ]
                )
                let result = try context.fetch(descriptor)
                return result
            }
            catch {
                debugPrint("Error Fetching Notification for userID: \(userID)")
            }
        }
        
        return []
    }
    
    func fetchCount(userID: String) -> Int {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<UserNotificationSchema>(
                    predicate: #Predicate { $0.userID == userID}
                )
                let result = try context.fetchCount(descriptor)
                return result
            }
            catch {
                debugPrint("Error Fetching Notification for userID: \(userID)")
            }
        }
        return 0
    }
    
    func fetchBy(stockNewsID: String) -> [UserNotificationSchema] {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<UserNotificationSchema>(
                    predicate: #Predicate { $0.stockNewsID == stockNewsID },
                    sortBy: [
                        .init(\.releasedTime, order: .reverse)
                    ]
                )
                let result = try context.fetch(descriptor)
                return result
            }
            catch {
                debugPrint("Error Fetching Notification for userID: \(stockNewsID)")
            }
        }
        
        return []
    }
    
    func save(_ notification: UserNotificationSchema) throws {
        if let context = modelContext {
            let notificationID = notification.notificationID
            
            let descriptor = FetchDescriptor<UserNotificationSchema>(
                predicate: #Predicate { $0.notificationID == notificationID }
            )
             
            guard try context.fetch(descriptor).first == nil else {
                throw SwiftDataError.alreadyExists( notification)
            }
            
            context.insert(notification)
            try context.save()
        }
    }
    
    func delete(_ notificationID: String) throws {
        if let context = modelContext {
            let descriptor = FetchDescriptor<UserNotificationSchema>(
                predicate: #Predicate { $0.notificationID == notificationID }
            )
            
            guard let notification = try context.fetch(descriptor).first else {
                throw SwiftDataError.notFound( notificationID)
            }
            
            context.delete(notification)
            try context.save()
        }
    }
    
    func update(notificationID: String, hasTriggered: Bool) throws {
        if let context = modelContext {
            let descriptor = FetchDescriptor<UserNotificationSchema>(
                predicate: #Predicate { $0.notificationID == notificationID }
            )
            
            guard let notification = try context.fetch(descriptor).first else {
                throw SwiftDataError.notFound( notificationID)
            }
            
            notification.hasTriggered = hasTriggered
            try context.save()
        }
    }
    
    
    
}
