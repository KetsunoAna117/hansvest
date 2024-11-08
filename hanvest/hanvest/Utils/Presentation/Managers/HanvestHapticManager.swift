//
//  HanvestHapticManager.swift
//  hanvest
//
//  Created by Bryan Vernanda on 08/11/24.
//

import SwiftUI

struct HanvestHapticManager {
    static func hapticNotif(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    static func hapticImpact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
