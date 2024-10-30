//
//  HighlightHelper.swift
//  hanvest
//
//  Created by Bryan Vernanda on 30/10/24.
//

import SwiftUI

extension View {
    @ViewBuilder
    func showCase(order: Int, title: String, detail: String, cornerRadius: CGFloat, style: RoundedCornerStyle, scale: CGFloat = 1, stage: HighlightComponentStage) -> some View {
        self
        /// storing it in Anchor Preference
            .anchorPreference(key: HighlightAnchorKey.self, value: .bounds) { anchor in
                let highlight = Highlight(anchor: anchor, title: title, detail: detail, cornerRadius: cornerRadius, style: style, scale: scale, stage: stage)
                return [order: highlight]
            }
    }
}

/// showcase root view modifier
struct ShowCaseRoot: ViewModifier {
    var showHighlights: Bool
    var stage: HighlightComponentStage
    var onFinished: ((Bool) -> Void)
    
    /// View properties
    @State private var highlightOrder: [Int] = []
    @State private var currentHightlight: Int = 0
    @State private var showView: Bool = true
    /// popover
    @State private var showTitle: Bool = true
    /// Namespace ID, for smooth shape transitions
    
    @Namespace private var animation
    func body(content: Content) -> some View {
        content
            .onPreferenceChange(HighlightAnchorKey.self) { value in
                // Filter highlights based on the current show state condition
                highlightOrder = value
                    .filter { $0.value.stage == stage }
                    .map { $0.key }
                    .sorted()
            }
            .onChange(of: stage) { _, newValue in
                // Reset showcase state when `changeShowState` updates
                if newValue == .buyStage {
                    currentHightlight = 0
                    showView = true
                    showTitle = true
                }
            }
            .overlayPreferenceValue(HighlightAnchorKey.self) { preferences in
                if highlightOrder.indices.contains(currentHightlight), showHighlights, showView {
                    if let highlight = preferences[highlightOrder[currentHightlight]] {
                        HighlightView(highlight)
                    }
                }
            }
    }
    
    @ViewBuilder
     func HighlightView(_ highlight: Highlight) -> some View {
         GeometryReader { proxy in
             let highlightRect = proxy[highlight.anchor]
             let safeArea = proxy.safeAreaInsets
             
             Rectangle()
                 .fill(.black.opacity(0.5))
                 .reverseMask {
                     Rectangle()
                         .matchedGeometryEffect(id: "HIGHLIGHTSHAPE", in: animation)
                         .frame(width: highlightRect.width + 5, height: highlightRect.height + 5)
                         .clipShape(RoundedRectangle(cornerRadius: highlight.cornerRadius, style: highlight.style))
                         .scaleEffect(highlight.scale)
                         .offset(x: highlightRect.minX - 2.5, y: highlightRect.minY + safeArea.top - 2.5)
                 }
                 .ignoresSafeArea()
                 .onChange(of: showTitle) { _, newValue in
                     if !newValue {
                         if currentHightlight >= highlightOrder.count - 1 {
                             withAnimation(.easeInOut(duration: 0.25)) {
                                 showView = false
                             }
                             onFinished(true)
                         } else {
                             withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.7, blendDuration: 0.7)) {
                                 currentHightlight += 1
                             }
                             
                             DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                 showTitle = true
                             }
                         }
                     }
                 }
             
             Rectangle()
                 .foregroundColor(.clear)
                 /// Adding border
                 /// Simply extend its size
                 .frame(width: highlightRect.width + 20, height: highlightRect.height + 20)
                 .clipShape(RoundedRectangle(cornerRadius: highlight.cornerRadius, style: highlight.style))
                 .popover(isPresented: $showTitle, content: {
                     VStack(spacing: 8) {
                         Text(highlight.title)
                         
                         Text(highlight.detail)
                     }
                     .padding(.horizontal, 10)
                     .presentationCompactAdaptation(.popover)
                 })
                 .scaleEffect(highlight.scale)
                 .offset(x: highlightRect.minX - 10, y: highlightRect.minY - 10)
         }
    }
}

/// custom view modifier for inner/reverse mask
extension View {
    @ViewBuilder
    func reverseMask<Content: View>(alignment: Alignment = .topLeading, @ViewBuilder content: @escaping () -> Content)
    -> some View {
        self
            .mask {
                Rectangle()
                    .overlay(alignment: .topLeading) {
                        content()
                            .blendMode(.destinationOut)
                    }
            }
    }
}
