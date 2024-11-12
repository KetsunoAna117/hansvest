//
//  AppRouterProtocol.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 15/10/24.
//

import Foundation
import SwiftUI

protocol AppRouterProtocol: ObservableObject {
    var path: NavigationPath { get set }
    var popup: Popup? { get set }
    var notification: HanvestNotification? { get set }
    var notificationPermission: Bool { get set }
    var startScreen: Screen? { get set }

    func push(_ screen:  Screen)
    func pop()
    func popToRoot()
    
    func presentOverlay(_ popup: Popup)
    func dismissPopup()
    
    func presentNotification(_ notification: HanvestNotification)
    func dismissNotification()
    func setNotificationPermission(_ permission: Bool)
}
