//
//  HanvestSellingCardDefaultState.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 17/10/24.
//

import SwiftUI

enum HanvestSellingCardDefaultState{
    case Affordable
    case Exceeded
    
    var textColor: Color {
        switch self {
        case .Affordable:
            return .mineShaft950
        case .Exceeded:
            return .sundown500
        }
    }
}
