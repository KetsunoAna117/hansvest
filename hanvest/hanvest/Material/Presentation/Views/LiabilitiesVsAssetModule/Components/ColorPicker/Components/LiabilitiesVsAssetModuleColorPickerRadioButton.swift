//
//  Testasd.swift
//  hanvest
//
//  Created by Bryan Vernanda on 15/10/24.
//

import SwiftUI

struct LiabilitiesVsAssetModuleColorPickerRadioButton: View {
    // Constant
    let radioButtonStyle: LiabilitiesVsAssetModuleColorOptions
    
    // Radio Behavior
    var radioButtonState: HanvestButtonState = .unpressed
    var action: () -> Void
    
    var body: some View {
        Button {
            HanvestSoundFXManager.playSound(soundFX: HanvestSoundFX.click)
            HanvestHapticManager.hapticNotif(type: .success)
            
            action()
        } label: {
            Circle()
                .fill(Color(radioButtonStyle.colorOptions))
                .frame(width: 60, height: 60)
        }
        .buttonStyle(LiabilitiesVsAssetModuleRadioButtonType(state: radioButtonState))
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(radioButtonStyle.colorDescription) color")
    }
}

#Preview {
    @Previewable @State var selectedButtonID = ""
    @Previewable let colorOptions = LiabilitiesVsAssetModuleColorOptions.allCases
    
    HStack(spacing: 24) {
        ForEach(colorOptions, id: \.self) { option in
            LiabilitiesVsAssetModuleColorPickerRadioButton(
                radioButtonStyle: option,
                radioButtonState: .pressed,
                action: {}
            )
        }
    }
}
