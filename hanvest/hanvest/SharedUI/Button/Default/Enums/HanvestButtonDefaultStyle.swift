//
//  HanvestButtonDefaultStyle.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 09/10/24.
//

import SwiftUI

enum HanvestButtonDefaultStyle {
    case filled(isDisabled: Bool)
    case bordered(isDisabled: Bool)
    case borderless(isDisabled: Bool)
    
    // Computed property that extracts the isDisabled value for any case
    var isDisabled: Bool {
        switch self {
        case .filled(let isDisabled),
                .bordered(let isDisabled),
                .borderless(let isDisabled):
            return isDisabled
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .filled(let isDisabled):
            return isDisabled ? .fillTertiary : .seagull400
        case .bordered(let isDisabled):
            return isDisabled ? .clear : .mineShaft50
        case .borderless:
            return .clear
        }
    }
    
    var fontColor: Color {
        switch self {
        case .filled(let isDisabled):
            return isDisabled ? .labelTertiary : .mineShaft50
            
        case .bordered(let isDisabled):
            return isDisabled ? .labelTertiary : .seagull400
            
        case .borderless(let isDisabled):
            return isDisabled ? .labelTertiary : .seagull400
        }
    }
    
    var borderColor: Color {
        switch self {
        case .filled(let isDisabled):
            return isDisabled ? .clear : .seagull400
        case .bordered(let isDisabled):
            return isDisabled ? .labelTertiary : .seagull400
        case .borderless:
            return .clear
        }
    }
    
    var shadowColor: Color {
        switch self {
        case .filled(let isDisabled),
                .bordered(let isDisabled):
            return isDisabled ? .clear : .seagull500
        case .borderless:
            return .clear
        }
    }
}
