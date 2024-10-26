//
//  MainView-Placeholder-TipKit.swift
//  hanvest
//
//  Created by Bryan Vernanda on 26/10/24.
//

import TipKit

enum MainViewTip: Tip {
    case thisIsNotification
    case virtualBalance
    
    var id: String {
        return String(describing: self)
    }
    
    var title: Text {
        switch self {
            case .thisIsNotification:
                Text("This is Notification")
            case .virtualBalance:
                Text("Virtual Balance")
        }
    }
    
    var message: Text? {
        switch self {
            case .thisIsNotification:
                Text("You can see new news here.")
            case .virtualBalance:
                Text("A digital token that can be used to buy stocks and virtual items like accessories.")
        }
    }
    
    var image: Image? {
        switch self {
            case .thisIsNotification:
                Image(systemName: "chart.bar.horizontal.page")
            case .virtualBalance:
                Image(systemName: "creditcard")
        }
    }
    
}
