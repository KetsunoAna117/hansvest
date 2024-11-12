//
//  HanvestButtonRadioBehavior.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/11/24.
//


//
//  HanvestButton.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 09/10/24.
//

import SwiftUI

struct HanvestVerticalRadioButtonBehavior: View {
    // Constants
    let SHADOW_OFFSET: CGFloat = 5
    
    // Styling Variable (Initialized Before)
    var size: HanvestVerticalButtonSize = .large
    var style: HanvestVerticalButtonStyle = .filled
    
    @State private var state: HanvestVerticalButtonState = .unselected
    
    // Bind to the parent selection
    @Binding var selectedButtonID: String
    
    // Button content
    var id: String = UUID().uuidString
    var label: String
    var image: Image
    var action: (() -> Void)? = nil
    
    var body: some View {
        VStack() {
            VStack {
                image
                    .foregroundStyle(style.fontColor)
                
                Text(label)
                    .foregroundStyle(style.fontColor)
                    .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: self.state)
                    .font(.nunito(.caption2))
            }
        }
        .frame(minWidth: size.minWidth, minHeight: size.minHeight)
        .multilineTextAlignment(.center)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(style == .filled ? state.backgroundColor : .clear)
                .shadow(
                    color: style == .filled ? state.shadowColor : .clear,
                    radius: getPressedStatus() ? 0 : 0, x: 0, y: getPressedStatus() ? 0 : SHADOW_OFFSET // Shadow changes when pressed
            )
            
        )
        .offset(y: getPressedStatus() ? SHADOW_OFFSET : 0) // Button moves down by 4 points when pressed
        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: self.state)
        .onTapGesture {
            if selectedButtonID != id {
                self.selectedButtonID = self.id
                state = .selected
                action?()
            }
        }
        .onChange(of: selectedButtonID) { oldValue, newValue in
            if newValue != id {
                state = .unselected
            }
            else {
                state = .selected
            }
        }
        .onAppear(){
            if selectedButtonID == id {
                self.state = .selected
            }
        }
    }
    
    func getPressedStatus() -> Bool {
        return state == .selected
    }
    
}

#Preview {
    @Previewable @State var selectedButtonID = "First-Button"
    
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
        HStack(spacing: 16) {
            HanvestVerticalRadioButtonBehavior(
                size: .large,
                style: .filled,
                selectedButtonID: $selectedButtonID,
                id: "First-Button",
                label: "Report",
                image: Image(systemName: "checkmark"),
                action: {
                    debugPrint("Hello First Button Pressed")
                }
            )
            HanvestVerticalRadioButtonBehavior(
                size: .large,
                style: .filled,
                selectedButtonID: $selectedButtonID,
                id: "Second-Button",
                label: "Report",
                image: Image(systemName: "person"),
                action: {
                    debugPrint("Hello Second Button Pressed")
                }
            )
            HanvestVerticalRadioButtonBehavior(
                size: .large,
                style: .filled,
                selectedButtonID: $selectedButtonID,
                id: "Third-Button",
                label: "Report",
                image: Image(systemName: "person.fill"),
                action: {
                    debugPrint("Hello Third Button Pressed")
                }
            )
            
        }
        .padding(.top, 8)
    }
    .padding(.horizontal, 16)
}
