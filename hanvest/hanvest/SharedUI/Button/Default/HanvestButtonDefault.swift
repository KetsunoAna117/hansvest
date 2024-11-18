//
//  HanvestButtonDefault.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 09/10/24.
//

import SwiftUI

struct HanvestButtonDefault: View {
    // Constants
    let SHADOW_OFFSET: CGFloat = 5
    
    // Styling Variable (Initialized Before)
    var size: HanvestButtonSize = .large
    var style: HanvestButtonStyle = .filled(isDisabled: false)
    var iconPosition: HanvestButtonIconPosition = .leading
    
    // Button content
    var title: String
    var image: Image?
    var action: () -> Void
    
    var body: some View {
        Button(
            action: {
                if self.style.isDisabled == false {
                    HanvestSoundFXManager.playSound(soundFX: HanvestSoundFX.click)
                    HanvestHapticManager.hapticNotif(type: .success)
    
                    action()
                }
            }, label: {
                ZStack(alignment: iconPosition.alignment, content: {
                    // If the icon position is leading, place the image first
                    if iconPosition == .leading, let image = image {
                        image
                            .foregroundStyle(style.fontColor)
                            .padding(.leading, 16)
                    }
                    
                    Text(title)
                        .foregroundStyle(style.fontColor)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.nunito(.body))
                        .padding(.horizontal, size.textHorizontalPadding)
                    
                    // If the icon position is trailing, place the image first
                    if iconPosition == .trailing, let image = image {
                        image
                            .foregroundStyle(style.fontColor)
                            .padding(.trailing, 16)
                    }
                })
            }
        )
        .buttonStyle(HanvestButtonType(size: size, style: style))
        .disabled(style.isDisabled)
    }
}

#Preview {
    @Previewable @State var isDisabled: Bool = true
    VStack() {
        HStack {
            VStack(alignment: .leading) {
                Text("This is a button example!")
                    .font(.nunito(.title3, .bold))
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eget libero a urna porttitor rutrum.")
                    .font(.nunito(.body))
            }
            Spacer()
        }
        VStack(spacing: 16) {
            HanvestButtonDefault(
                size: .large,
                style: .filled(isDisabled: isDisabled),
                iconPosition: .leading,
                title: "Button",
                image: Image(systemName: "person.fill"),
                action: {
                    debugPrint("Button Pressed!")
                }
            )
            HanvestButtonDefault(
                style: .filledIncorrect(isDisabled: false),
                title: "Set Disabled",
                action: {
                    isDisabled.toggle()
                }
            )
        }
        .padding(.top, 16)
    }
    .padding(.horizontal, 16)
}
