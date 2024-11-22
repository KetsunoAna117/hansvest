//
//  HanvestButtonType.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 18/11/24.
//

import SwiftUI

struct HanvestButtonType: ButtonStyle {
    // Constants
    let SHADOW_OFFSET: CGFloat = 5
    
    // Styling Variable (Initialized Before)
    var size: HanvestButtonSize
    var style: HanvestButtonStyle
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: size.maxWidth)
            .padding(.horizontal, size.horizontalPadding)
            .padding(.vertical, size.verticalPadding)
            .multilineTextAlignment(.center)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(style.backgroundColor)
                    .shadow(
                        color: configuration.isPressed ? .clear : style.shadowColor,
                        radius: 0,
                        x: 0,
                        y: configuration.isPressed ? 0 : SHADOW_OFFSET // Shadow changes when pressed
                    )
                
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(style.borderColor, lineWidth: 0.5) // Default stroke
            )
            .offset(y: configuration.isPressed ? SHADOW_OFFSET : 0) // Button moves down by 4 points when pressed
            .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: (configuration.isPressed || !configuration.isPressed))
    }
}
