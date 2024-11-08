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
    var initialState: HanvestButtonState = .unpressed
    
    @State private var state: HanvestButtonState = .unpressed
    
    // Button content
    var title: String
    var image: Image?
    var action: () -> Void
    
    var body: some View {
        ZStack(alignment: iconPosition.alignment) {
            // If the icon position is leading, place the image first
            if iconPosition == .leading, let image = image {
                image
                    .foregroundStyle(style.fontColor)
            }
            
            Text(title)
                .foregroundStyle(style.fontColor)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: self.state)
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.nunito(.body))
                .padding(.horizontal, size.textHorizontalPadding)
            
            // If the icon position is trailing, place the image first
            if iconPosition == .trailing, let image = image {
                image
                    .foregroundStyle(style.fontColor)
            }
        }
        .frame(maxWidth: size.minWidth)
        .padding(.horizontal, size.horizontalPadding)
        .padding(.vertical, size.verticalPadding)
        .multilineTextAlignment(.center)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(style.backgroundColor)
                .shadow(
                    color: getPressedStatus() ? .clear : style.shadowColor,
                    radius: getPressedStatus() ? 0 : 0, x: 0, y: getPressedStatus() ? 0 : SHADOW_OFFSET // Shadow changes when pressed
                )
            
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(style.borderColor, lineWidth: 0.5) // Default stroke
        )
        .offset(y: getPressedStatus() ? SHADOW_OFFSET : 0) // Button moves down by 4 points when pressed
        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: self.state)
        .onTapGesture {
            if self.style.isDisabled == false {
                self.state = .pressed
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                    self.state = .unpressed
                    action()
                })
            }
        }
        .onAppear {
            setupState()
        }
        .disabled(style.isDisabled)
    }
    
    func getPressedStatus() -> Bool {
        return state == .pressed
    }

    
    func setupState() {
        self.state = initialState
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
