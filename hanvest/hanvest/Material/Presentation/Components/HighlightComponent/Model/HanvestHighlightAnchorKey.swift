//
//  HighlightAnchorKey.swift
//  hanvest
//
//  Created by Bryan Vernanda on 30/10/24.
//

import SwiftUI

/// anchor key
struct HanvestHighlightAnchorKey: PreferenceKey {
    static var defaultValue: [Int: HanvestHighlightModel] = [:]
    
    static func reduce(value: inout [Int: HanvestHighlightModel], nextValue: () -> [Int: HanvestHighlightModel]) {
        value.merge(nextValue()) { $1 }
    }
    
    
}
