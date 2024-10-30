//
//  HanvestButtonRadioColorChangeBehavior.swift
//  hanvest
//
//  Created by Bryan Vernanda on 23/10/24.
//

import SwiftUI

struct HanvestButtonMultipleChoiceBehavior: View {
    // Constants
    let SHADOW_OFFSET: CGFloat = 5
    
    // Styling Variable (Initialized Before)
    var size: HanvestButtonSize = .large
    var iconPosition: HanvestButtonIconPosition = .leading
    var isChecked: HanvestButtonMultipleChoiceIsChecked = .isNotChecked(checkedCondition: true)
    
    @State private var state: HanvestButtonState = .unpressed
    @State private var style: HanvestButtonMultipleChoiceStyle = .unselected
    
    // Bind to the parent selection
    @Binding var selectedButtonID: String
    
    // Button content
    var id: String = UUID().uuidString
    var title: String
    var action: () -> Void
    
    var body: some View {
        ZStack(alignment: iconPosition.alignment) {
            // If the icon position is leading, place the image first
            if iconPosition == .leading, let image = style.image {
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
            if iconPosition == .trailing, let image = style.image {
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
        .onLongPressGesture(minimumDuration: 0, perform: {
            self.state = .pressed
        }, onPressingChanged: { isPressing in
            if !isPressing {
                doUnpressedAction()
            }
        })
        .onTapGesture {
            self.state = .pressed
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                doUnpressedAction()
            })
        }
        .onChange(of: selectedButtonID, { oldValue, newValue in
            guard newValue != self.id else { return }
            
            if isChecked == .isNotChecked(checkedCondition: true) {
                self.style = .unselected
            }
            
            self.state = .unpressed
        })
        .onChange(of: isChecked, { oldValue, newValue in
            if newValue == .isChecked(checkedCondition: true) {
                self.style = .filledCorrect
            } else if newValue == .isChecked(checkedCondition: false) {
                self.style = .filledIncorrect
            }
        })
        
    }
    
    private func getPressedStatus() -> Bool {
        return state == .pressed
    }
    
    private func doUnpressedAction() {
        self.state = .unpressed
        
        if self.selectedButtonID != self.id {
            self.selectedButtonID = self.id
            print("Selected Button ID: \(selectedButtonID)")
            
            if isChecked == .isNotChecked(checkedCondition: true) {
                self.style = .selected
            }
            
            action()
        }
    }
    
}

#Preview {
    @Previewable @State var selectedButtonID = ""
    
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
            HanvestButtonMultipleChoiceBehavior(
                size: .large,
                iconPosition: .leading,
                selectedButtonID: $selectedButtonID,
                id: "Third-Button",
                title: "C. Stocks provide ownership of company, while bonds represent a loan to issuer",
                action: {
                    
                }
            )
            HanvestButtonMultipleChoiceBehavior(
                size: .large,
                iconPosition: .leading,
                selectedButtonID: $selectedButtonID,
                id: "First-Button",
                title: "A. Stocks provide ownership of company, while bonds represent a loan to issuer",
                action: {
                    
                }
            )
            HanvestButtonMultipleChoiceBehavior(
                size: .large,
                iconPosition: .leading,
                selectedButtonID: $selectedButtonID,
                id: "Second-Button",
                title: "B. Stocks provide ownership of company, while bonds represent a loan to issuer",
                action: {
                    
                }
            )
        }
        .padding(.top, 8)
    }
    .padding(.horizontal, 16)
}
