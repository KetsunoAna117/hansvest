//
//  hanvestApp.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 30/09/24.
//

import SwiftUI
import TipKit

@main
struct hanvestApp: App {
    @StateObject private var appRouter = AppRouter()
    
    init(){
        AppModule.inject()
    }
    
    var body: some Scene {
        WindowGroup {
            @Inject var getUserData: GetUserData
            
            NavigationStack(path: $appRouter.path) {
                if let startScreen = appRouter.startScreen {
                    appRouter.build(startScreen)
                        .navigationDestination(for: Screen.self) { screen in
                            appRouter.build(screen)
                        }
                }
                else {
                    Text("Loading...")
                }
            }
            .preferredColorScheme(.light)
            .onAppear {
                let getUserData = getUserData.execute()
                
                switch getUserData {
                    case nil:
                        appRouter.startScreen = .onboarding
                    default:
                        appRouter.startScreen = .main
                }
            }
            .overlay {
                if let notification = appRouter.notification {
                    ZStack {
                        appRouter.build(notification)
                    }
                    .transition(.move(edge: .top)) // Slide-in and slide-out effect
                }
            }
            .animation(.linear(duration: 0.5), value: appRouter.notification != nil)
            .overlay {
                if let popup = appRouter.popup {
                    ZStack {
                        appRouter.build(popup)
                    }
                    // Apply transition and animation
                    .transition(.opacity) // You can use other transitions like .scale, .move, etc.
                }
            }
            .animation(.easeInOut(duration: 0.2), value: appRouter.popup != nil)

        }
    }
}
