//
//  Module02TextImage.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

enum LiabilitiesVsAssetModuleTextImagePageContent: Int, CaseIterable {
    case page01 = 0
    case page02 = 1
    case page06 = 5
    
    var title: String {
        switch self {
            case .page01:
                "There’s a brand new iphone just released"
            case .page02:
                "Now you go the store to get one for yourself"
            case .page06:
                "You are set up this your brand new iphone"
        }
    }
    
    var image: Image {
        switch self {
            case .page01, .page02:
                Image("iphone-pic-01")
            case .page06:
                Image("iphone-pic-02")
        }
    }
    
    var customSpacing: CGFloat {
        switch self {
            case .page01, .page02:
                24
            case .page06:
                65
        }
    }
    
}
