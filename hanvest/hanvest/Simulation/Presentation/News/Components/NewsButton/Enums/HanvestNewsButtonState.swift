//
//  HanvestNewsButtonState.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 15/10/24.
//

import SwiftUI

enum HanvestNewsButtonState {
    case unpressed
    case pressed
    
    var backgroundColor: Color {
        switch self {
        case .unpressed, .pressed:
            return .mineShaft50
        }
    }
    
    var fontColor: Color {
        switch self {
        case .unpressed, .pressed:
            return .primary
        }
    }
    
    var borderColor: Color {
        switch self {
        case .unpressed, .pressed:
            return .mineShaft200
        }
    }
    
    var shadowColor: Color {
        switch self {
        case .unpressed:
            return .mineShaft300
        case .pressed:
            return .clear
        }
    }
}
