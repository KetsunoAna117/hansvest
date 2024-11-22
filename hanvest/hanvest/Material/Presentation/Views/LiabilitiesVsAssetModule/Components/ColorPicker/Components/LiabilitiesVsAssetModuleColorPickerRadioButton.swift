//
//  Testasd.swift
//  hanvest
//
//  Created by Bryan Vernanda on 15/10/24.
//

import SwiftUI

struct LiabilitiesVsAssetModuleColorPickerRadioButton: View {
    // Constant
    let style: LiabilitiesVsAssetModuleColorOptions
    
    // Radio Behavior
    var state: HanvestButtonState = .unpressed
    var action: () -> Void
    
    var body: some View {
        Button {
            HanvestSoundFXManager.playSound(soundFX: HanvestSoundFX.click)
            HanvestHapticManager.hapticNotif(type: .success)
            
            action()
        } label: {
            Circle()
                .fill(Color(style.colorOptions))
        }
        .buttonStyle(LiabilitiesVsAssetModuleRadioButtonType(state: state))
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(style.colorDescription) color")
    }
}

#Preview {
    @Previewable @State var selectedButtonID = ""
    @Previewable let colorOptions = LiabilitiesVsAssetModuleColorOptions.allCases
    
    HStack(spacing: 24) {
        ForEach(colorOptions, id: \.self) { option in
            LiabilitiesVsAssetModuleColorPickerRadioButton(
                style: option,
                state: .pressed,
                action: {}
            )
        }
    }
}
