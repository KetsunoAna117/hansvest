//
//  Module02MultipleChoice.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

enum LiabilitiesVsAssetModuleMultipleChoicePageContent: Int, CaseIterable {
    case page03 = 2
    case page05 = 4
    case page07 = 6
    
    var questions: String {
        switch self {
            case .page03:
                "Now choose the type of iphone you want to get"
            case .page05:
                "Choose the storage capacity for your brand new iphone"
            case .page07:
                "Now it's time for you to pay, choose wisely your payment method"
        }
    }
    
    var image: Image? {
        switch self {
            case .page03, .page05:
                Image("iphone-pic-01")
            case .page07:
                nil
        }
    }
    
    var options: [String] {
        switch self {
            case .page03:
                ["Iphone 16", "Iphone 16 Pro Max"]
            case .page05:
                ["256 GB", "512 GB"]
            case .page07:
                ["Pay with Debit Card (Rp 24.999.000)", "Pay with PayLater (Rp 24.999.000)"]
        }
    }
    
}
