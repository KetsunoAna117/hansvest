//
//  Highlight.swift
//  hanvest
//
//  Created by Bryan Vernanda on 30/10/24.
//

import SwiftUI

struct HanvestHighlightModel: Identifiable, Equatable, Hashable {
    var id: UUID = .init()
    var anchor: Anchor<CGRect>
    var title: String
    var detail: String
    var cornerRadius: CGFloat
    var style: RoundedCornerStyle
    var scale: CGFloat
    var stage: String
}
