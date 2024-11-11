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
                debugPrint("Error Fetching news for newsID: \(id)")
            }
        }
        
        return nil
    }
    
    func fetchBy(userID: String) -> [UserNotificationSchema] {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<UserNotificationSchema>(
                    predicate: #Predicate { $0.userID == userID}
                )
                let result = try context.fetch(descriptor)
                return result
            }
            catch {
                debugPrint("Error Fetching news for userID: \(userID)")
            }
        }
        
        return []
    }
    
    func fetchBy(stockNewsID: String) -> [UserNotificationSchema] {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<UserNotificationSchema>(
                    predicate: #Predicate { $0.stockNewsID == stockNewsID }
                )
                let result = try context.fetch(descriptor)
                return result
            }
            catch {
                debugPrint("Error Fetching news for userID: \(stockNewsID)")
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
                throw SwiftDataError.alreadyExists(object: notification)
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
                throw SwiftDataError.notFound(object: notificationID)
            }
            
            context.delete(notification)
            try context.save()
        }
    }
    
    
}
