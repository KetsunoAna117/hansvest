//
//  ProgressBarWithXMarkView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 15/10/24.
//

import SwiftUI

struct ProgressBarWithXMarkView: View {
    // Constants
    let progressBarMinValue: Int
    let progressBarMaxValue: Int
    
    var action: () -> Void
    @Binding var progressBarCurrValue: Int
    
    var body: some View {
        HStack(spacing: 0) {
            Button {
                action()
                HanvestSoundFXManager.playSound(soundFX: HanvestSoundFX.click)
            } label: {
                Image(systemName: "xmark")
                    .font(.system(size: 24))
                    .foregroundStyle(.labelPrimary)
                    .padding(8)
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel("xmark button")
            }
            
            
            HStack {
                HanvestProgressBar(
                    value:
                        $progressBarCurrValue,
                    minimum:
                        progressBarMinValue,
                    maximum:
                        progressBarMaxValue
                )
                .accessibilityElement(children: .ignore)
                .accessibilityLabel("Progress bar")
            }
            .padding(8)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ProgressBarWithXMarkView(
        progressBarMinValue: 0,
        progressBarMaxValue: 100,
        action: {},
        progressBarCurrValue: .constant(4)
    )
}
