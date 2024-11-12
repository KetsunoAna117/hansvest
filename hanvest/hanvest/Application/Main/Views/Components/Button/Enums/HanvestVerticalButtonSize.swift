//
//  HanvestVerticalButtonSize.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/11/24.
//

import SwiftUI

enum HanvestVerticalButtonSize {
    case large
    case medium
    
    var verticalPadding: CGFloat {
        switch self {
        case .large:
            return 8
        case .medium:
            return 4
        }
    }
    
    var horizontalPadding: CGFloat {
        switch self {
        case .large:
            return 12
        case .medium:
            return 12
        }
    }
    
    var minHeight: CGFloat {
        switch self {
        case .large:
            return 55
        case .medium:
            return 29
        }
    }
    
    var minWidth: CGFloat {
        switch self {
        default:
            return 55
        }
    }
}
