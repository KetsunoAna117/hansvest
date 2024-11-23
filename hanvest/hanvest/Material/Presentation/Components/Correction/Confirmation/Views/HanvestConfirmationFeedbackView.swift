//
//  HanvestConfirmationFeedbackView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 10/10/24.
//

import SwiftUI

struct HanvestConfirmationFeedbackView: View {
    var state: HanvestConfirmationFeedbackState
    var action: () -> ()
    
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                HStack {
                    HanvestCorrectionSymbolView(state: state.iconType)
                        .padding(.trailing, 8)
                    Text(state.content)
                        .font(.nunito(.title2, .bold))
                        .foregroundStyle(state.fontColor)
                    Spacer()
                }
                
                HanvestButtonDefault(
                    style: state.buttonStyle,
                    title: "Continue",
                    action: action
                )
            }
            .padding(.horizontal, 20)
            .padding(.top, 8)
            .padding(.bottom, 54)
        }
        .frame(maxWidth: .infinity)
        .background(state.backgroundColor)
        .onAppear {
            HanvestSoundFXManager.playSound(soundFX: state.soundFX)
            HanvestHapticManager.hapticNotif(type: .success)
        }
    }
}

#Preview {
    HanvestConfirmationFeedbackView(
        state: .correct, action: {
            debugPrint("Button Pressed!")
        }
    )
}
