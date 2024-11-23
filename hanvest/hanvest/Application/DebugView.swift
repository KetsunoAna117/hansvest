//
//  ContentView.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 30/09/24.
//

import SwiftUI

struct DebugView: View {
    // Router
    let router: any AppRouterProtocol
    
    var body: some View {
        VStack(spacing: 16) {
            Text("This is a Button")
            
            Button(action: {
                print("Button Pressed")
            }, label: {
                Text("Press me!")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
            })
            .buttonStyle(
                CustomButtonStyle(
                    size: .large,
                    style: .filled(isDisabled: false)
                )
            )
        }
        .padding(.horizontal, 16)
    }
}

private struct CustomButtonStyle: ButtonStyle {
    let SHADOW_OFFSET: CGFloat = 5
    
    var size: HanvestButtonSize = .large
    var style: HanvestButtonStyle = .filled(isDisabled: false)
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(style.backgroundColor)
                    .shadow(
                        color: configuration.isPressed ? .clear : style.shadowColor,
                        radius: 0,
                        x: 0,
                        y: configuration.isPressed ? 0 : SHADOW_OFFSET
                    )
                
            )
            .frame(maxWidth: size.maxWidth)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(style.borderColor, lineWidth: 0.5)
            )
            .offset(y: configuration.isPressed ? SHADOW_OFFSET : 0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: (configuration.isPressed || !configuration.isPressed))
            .foregroundStyle(style.fontColor)
    }
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .debug
    
    NavigationStack(path: $appRouter.path) {
        if let startScreen = startScreen {
            appRouter.build(startScreen)
                .navigationDestination(for: Screen.self) { screen in
                    appRouter.build(screen)
                }
                .overlay {
                    if let popup = appRouter.popup {
                        ZStack {
                            appRouter.build(popup)
                        }
                       
                    }
                }
        }
    }
}
