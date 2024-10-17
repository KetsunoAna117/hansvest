//
//  ContentView.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 30/09/24.
//

import SwiftUI

struct ContentView: View {
    // Router
    let router: any AppRouterProtocol
    
    @State var presentOverlay: Bool = true
    
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                
                Text("Hello, world!")
                
                HanvestButtonDefault(
                    size: .medium,
                    style: .filledCorrect(isDisabled: false),
                    title: "Show Overlay") {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                            presentOverlay = true
                            router.presentPopup(
                                .withHanvestPopup(
                                    title: "News",
                                    desc: "Learn action to take based on news",
                                    dismissAction: {
                                        print("Button Action trigerred")
                                    }
                                )
                            )
                        })
                    }
                    .zIndex(presentOverlay ? 100 : 0)
            }
            .padding()
        }
    }
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .contentview
    
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
