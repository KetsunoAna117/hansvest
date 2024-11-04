//
//  Testasd.swift
//  hanvest
//
//  Created by Bryan Vernanda on 15/10/24.
//

import SwiftUI

struct HanvestColorPickerRadioButton: View {
    // Constant
    let radioButtonColor: Color
    
    // Button content
    var id: String = UUID().uuidString
    
    // Radio Behavior
    @State private var state: HanvestButtonState = .unpressed
    @Binding var selectedButtonID: String
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color(radioButtonColor))
                .frame(width: 60, height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: 100)
                    .inset(by: 1)
                    .stroke(getPressedStatus() ? Color.seagull600 : Color.clear, lineWidth: 2)
                )
            
            Circle()
                .fill(Color(radioButtonColor))
                .frame(width: 56, height: 56)
                .overlay(
                    RoundedRectangle(cornerRadius: 100)
                    .inset(by: 2)
                    .stroke(getPressedStatus() ? Color.seagull50 : Color.clear, lineWidth: 4)
                )
        }
        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: self.state)
        .onTapGesture {
            if self.selectedButtonID != self.id {
                self.selectedButtonID = self.id
                action()
            }
        }
        .onLongPressGesture(minimumDuration: 0.1, perform: {
            if self.selectedButtonID != self.id {
                self.selectedButtonID = self.id
                action()
            }
        }, onPressingChanged: { isPressing in
            withAnimation {
                self.state = .pressed
            }
        })
        .onChange(of: selectedButtonID, { _, newValue in
            if newValue != self.id {
                self.state = .unpressed
            }
        })
    }
    
    func getPressedStatus() -> Bool {
        return state == .pressed
    }
}

#Preview {
    @Previewable @State var selectedButtonID = ""
    @Previewable let colorOptions = HanvestModule02ColorOptions.allCases
    
    HStack(spacing: 24) {
        ForEach(colorOptions, id: \.self) { option in
            HanvestColorPickerRadioButton(
                radioButtonColor: option.colorOptions,
                selectedButtonID: $selectedButtonID,
                action: {}
            )
        }
    }
}
