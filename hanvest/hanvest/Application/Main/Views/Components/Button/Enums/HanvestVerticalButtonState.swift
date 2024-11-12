//
//  HanvestVerticalButtonState.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/11/24.
//

import SwiftUI

enum HanvestVerticalButtonState {
    case selected
    case unselected
    
    var backgroundColor: Color {
        switch self {
        case .selected:
            return .seagull400
        case .unselected:
            return .mineShaft400
        }
    }
    
    var shadowColor: Color {
        switch self {
        case .selected:
            return .seagull500
        case .unselected:
            return .mineShaft500
        }
    }
}
