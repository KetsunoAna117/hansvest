//
//  HanvestButtonSize.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 09/10/24.
//

import SwiftUI

enum HanvestButtonSize {
    case large
    case medium
    
    var maxWidth: CGFloat {
        switch self {
        case .large:
            return .infinity
        case .medium:
            return 170
        }
    }
    
    var verticalPadding: CGFloat {
        switch self {
        case .large:
            return 14
        case .medium:
            return 8
        }
    }
    
    var horizontalPadding: CGFloat {
        switch self {
        case .large:
            return 8
        case .medium:
            return 8
        }
    }
    
    var textHorizontalPadding: CGFloat {
        switch self {
        case .large:
            return 28
        case .medium:
            return 26
        }
    }
}
