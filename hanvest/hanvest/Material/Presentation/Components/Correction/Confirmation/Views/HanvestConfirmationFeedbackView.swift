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
            VStack {
                HStack {
                    HanvestCorrectionSymbolView(state: state.iconType)
                        .padding(.trailing, 8)
                    Text(state.content)
                        .font(.nunito(.title2, .bold))
                        .foregroundStyle(state.fontColor)
                    Spacer()
                }
                .padding(.bottom, 8)
                
                HanvestButtonDefault(
                    style: state.buttonStyle, title: "Continue",
                    action: action
                )
            }
            .padding(.horizontal, 20)
            .padding(.top, 12)
            .padding(.bottom, 54)
        }
        .frame(maxWidth: .infinity)
        .background(state.backgroundColor)
        .onAppear {
            HanvestSoundFXManager.playSound(named: state.soundFX)
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
