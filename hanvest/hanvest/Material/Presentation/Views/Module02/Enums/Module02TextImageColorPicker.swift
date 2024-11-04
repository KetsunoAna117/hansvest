//
//  Module02TextImageColorPicker.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

enum Module02TextImageColorPicker: Int {
    case page04 = 3
    
    var title: String {
        switch self {
            case .page04:
                "Now choose the color you want"
        }
    }
    
    var image: Image {
        switch self {
            case .page04:
                Image("iphone-pic-01")
        }
    }
    
    var customSpacing: CGFloat {
        switch self {
            case .page04:
                98
        }
    }
}
