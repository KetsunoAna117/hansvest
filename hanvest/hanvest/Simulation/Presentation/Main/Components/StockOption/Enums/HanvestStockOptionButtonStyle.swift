//
//  HanvestStockOptionButtonStyle.swift
//  hanvest
//
//  Created by Bryan Vernanda on 21/11/24.
//

import SwiftUI

enum HanvestStockOptionButtonStyle: CaseIterable {
    case ENTB
    case BIVI
    case GOMM
    case BBSU
    case TEJA
    case GOTE
    case defaultColor
    
    var stockName: String {
        return (String(describing: self))
    }
    
    var shadowColor: Color {
        switch self {
            case .ENTB: return .ENTB
            case .BIVI: return .BIVI
            case .GOMM: return .GOMM
            case .BBSU: return .BBSU
            case .TEJA: return .TEJA
            case .GOTE: return .GOTE
            case .defaultColor: return .mineShaft700
        }
    }
}
