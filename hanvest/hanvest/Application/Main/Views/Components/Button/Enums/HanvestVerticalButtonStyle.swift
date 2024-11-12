//
//  HanvestVerticalButtonStyle.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/11/24.
//

import SwiftUI

enum HanvestVerticalButtonStyle {
    case filled
    case borderless
    
    var fontColor: Color {
        switch self {
        case .filled:
            return .seagull50
        case .borderless:
            return .seagull500
        }
    }
}
