//
//  HanvestModuleNumberType.swift
//  hanvest
//
//  Created by Bryan Vernanda on 23/11/24.
//

import SwiftUI

struct HanvestModuleNumberType: ButtonStyle {
    // Constants
    let SHADOW_OFFSET: CGFloat = 5
    let WIDTH: CGFloat = 80
    let HEIGHT: CGFloat = 80
    
    // Styling Variable (Initialized Before)
    var style: HanvestModuleNumberDefaultStyle
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: WIDTH, maxHeight: HEIGHT)
            .multilineTextAlignment(.center)
            .background(
                Circle()
                    .fill(style.backgroundColor)
                    .shadow(
                        color: configuration.isPressed ? .clear : style.shadowColor,
                        radius: 0,
                        x: 0,
                        y: configuration.isPressed ? 0 : SHADOW_OFFSET
                    )
                
            )
            .offset(y: configuration.isPressed ? SHADOW_OFFSET : 0) // Button moves down by 4 points when pressed
            .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: (configuration.isPressed || !configuration.isPressed))
    }
}
