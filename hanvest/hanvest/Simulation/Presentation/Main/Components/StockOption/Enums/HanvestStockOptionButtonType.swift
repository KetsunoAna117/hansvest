//
//  HanvestStockOptionButtonType.swift
//  hanvest
//
//  Created by Bryan Vernanda on 21/11/24.
//

import SwiftUI

struct HanvestStockOptionButtonType: ButtonStyle {
    // Constants
    let SHADOW_OFFSET: CGFloat = 5
    let WIDTH: CGFloat = 75
    let HEIGHT: CGFloat = 75
    
    var style: HanvestStockOptionButtonStyle
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: WIDTH, maxHeight: HEIGHT)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.mineShaft700)
                    .shadow(
                        color: configuration.isPressed ? .clear : style.shadowColor,
                        radius: 0,
                        x: 0,
                        y: configuration.isPressed ? 0 : SHADOW_OFFSET
                    )
                
            )
            .offset(y: configuration.isPressed ? SHADOW_OFFSET : 0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: (configuration.isPressed || !configuration.isPressed))
    }
    
}
