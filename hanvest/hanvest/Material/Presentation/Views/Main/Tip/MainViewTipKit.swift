//
//  MainView-Placeholder-TipKit.swift
//  hanvest
//
//  Created by Bryan Vernanda on 26/10/24.
//

import TipKit

struct Module06ThisIsNotificationTip: Tip {
    var title: Text {
        Text("This is Notification")
    }
    
    var message: Text? {
        Text("You can see new news here.")
    }
    
    var asset: Image? {
        Image(systemName: "chart.bar.horizontal.page")
    }
}

struct Module02VirtualBalanceTip: Tip {
    var title: Text {
        Text("Virtual Balance")
    }
    
    var message: Text? {
        Text("A digital token that can be used to buy stocks and virtual items like accessories.")
    }
    
    var asset: Image? {
        Image(systemName: "creditcard")
    }
}
