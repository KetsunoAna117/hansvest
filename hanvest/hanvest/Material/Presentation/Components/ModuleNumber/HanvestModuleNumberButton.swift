//
//  HanvestNumberButton.swift
//  hanvest
//
//  Created by Bryan Vernanda on 09/10/24.
//

import SwiftUI

struct HanvestModuleNumberButton: View {
    // Constants
    let SHADOW_OFFSET: CGFloat = 5
    
    var initialState: HanvestModuleNumberDefaultState = .unpressed
    @State private var state: HanvestModuleNumberDefaultState = .unpressed
    
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
    
    var body: some View {
        ZStack {
            Circle()
                .fill(style.backgroundColor)
                .shadow(
                    color: getPressedStatus() ? .clear : style.shadowColor,
                    radius: getPressedStatus() ? 0 : 0, x: 0, y: getPressedStatus() ? 0 : SHADOW_OFFSET
                )
                
            imageOrNumberViewBuilder
                .font(.nunito(.largeTitle, .bold))
                .foregroundStyle(.mineShaft50)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: self.state)
        }
        .frame(maxWidth: 80, maxHeight: 80)
        .offset(y: getPressedStatus() ? SHADOW_OFFSET : 0)
        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: self.state)
        .onTapGesture {
            if self.style != .next {
                self.state = .pressed
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                    self.state = .unpressed
                    action()
                })
            }
        }
        .onAppear {
            self.state = self.initialState
        }
    }
    
    func getPressedStatus() -> Bool {
        return state == .pressed
    }
}


#Preview {
    // To test for checkmark:
    // change "number" param to "image" with the content is
    // Image(systemName: "checkmark")
    // and change style to .done
    
    VStack {
        HanvestModuleNumberButton(
            initialState: .unpressed,
            style: .done,
            number: 1, action: {
                print("Hello World!")
            })
    }
    .padding(.horizontal, 16)
}
