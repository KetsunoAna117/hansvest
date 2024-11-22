//
//  HanvestNumberButton.swift
//  hanvest
//
//  Created by Bryan Vernanda on 09/10/24.
//

import SwiftUI

struct HanvestModuleNumberButton: View {
    // Styling variable
    var style: HanvestModuleNumberDefaultStyle = .current
    
    // Button content
    var number: Int?
    var action: () -> Void
    
    @ViewBuilder
    var imageOrNumberViewBuilder: some View {
        if style == .done {
            Image(systemName: "checkmark")
        } else if let number = number {
            Text("\(number)")
        }
    }
    
    // State to prevent rapid multiple actions
    @State private var state: HanvestButtonState = .pressed
    
    var body: some View {
        Button {
            if state == .pressed {
                state = .unpressed
                
                HanvestSoundFXManager.playSound(soundFX: HanvestSoundFX.click)
                HanvestHapticManager.hapticNotif(type: .success)
                
                action()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    state = .pressed
                }
            }
        } label: {
            ZStack {
                Circle()
                    .fill(style.backgroundColor)
                    
                imageOrNumberViewBuilder
                    .font(.nunito(.largeTitle, .bold))
                    .foregroundStyle(.mineShaft50)
            }
        }
        .buttonStyle(HanvestModuleNumberType(style: style))
        .disabled(style == .next || state == .unpressed)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Module \(number ?? 0)")
    }

}


#Preview {
    // To test for checkmark:
    // change "number" param to "image" with the content is
    // Image(systemName: "checkmark")
    // and change style to .done
    
    VStack {
        HanvestModuleNumberButton(
            style: .done,
            number: 1, action: {
                debugPrint("Hello World!")
            })
    }
    .padding(.horizontal, 16)
}
