//
//  LiabilitiesVsAssetModuleRadioButtonType.swift
//  hanvest
//
//  Created by Bryan Vernanda on 22/11/24.
//

import SwiftUI

struct LiabilitiesVsAssetModuleRadioButtonType: ButtonStyle {
    // Constants
    let SHADOW_OFFSET: CGFloat = 5
    let WIDTH: CGFloat = 60
    let HEIGHT: CGFloat = 60
    
    var state: HanvestButtonState
    
    func makeBody(configuration: Configuration) -> some View {
        let pressedStatus: Bool = (configuration.isPressed || state == .pressed)
        
        configuration.label
            .frame(maxWidth: WIDTH, maxHeight: HEIGHT)
            .overlay(
                ZStack {
                    Circle()
                        .fill(Color.clear)
                        .frame(width: 60, height: 60)
                        .overlay(
                            RoundedRectangle(cornerRadius: 100)
                            .inset(by: 1)
                            .stroke(pressedStatus ? Color.seagull600 : Color.clear, lineWidth: 2)
                        )
                    
                    Circle()
                        .fill(Color.clear)
                        .frame(width: 56, height: 56)
                        .overlay(
                            RoundedRectangle(cornerRadius: 100)
                                .inset(by: 2)
                                .stroke(pressedStatus ? Color.seagull50 : Color.clear, lineWidth: 4)
                        )
                }
            )
            .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: (configuration.isPressed || !configuration.isPressed))
    }
}
