//
//  HanvestNewsButtonType.swift
//  hanvest
//
//  Created by Bryan Vernanda on 23/11/24.
//

import SwiftUI

struct HanvestNewsButtonType: ButtonStyle {
    // Constants
    let SHADOW_OFFSET: CGFloat = 5
    
    // State for styling variable
    var state: HanvestNewsButtonState
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(state.backgroundColor)
                    .shadow(
                        color: configuration.isPressed ? .clear : state.shadowColor,
                        radius: 0,
                        x: 0,
                        y: configuration.isPressed ? 0 : SHADOW_OFFSET // Shadow changes when pressed
                    )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(state.borderColor, lineWidth: 0.5) // Default stroke
            )
            .offset(y: configuration.isPressed ? SHADOW_OFFSET : 0) // Button moves down by 4 points when pressed
            .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: (configuration.isPressed || !configuration.isPressed))
    }
}
