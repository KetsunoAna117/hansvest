//
//  HighlightAnchorKey.swift
//  hanvest
//
//  Created by Bryan Vernanda on 30/10/24.
//

import SwiftUI

/// anchor key
struct HighlightAnchorKey: PreferenceKey {
    static var defaultValue: [Int: Highlight] = [:]
    
    static func reduce(value: inout [Int: Highlight], nextValue: () -> [Int: Highlight]) {
        value.merge(nextValue()) { $1 }
    }
    
    
}
