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
            @Inject var saveUserData: SaveUserData
            
            NavigationStack(path: $appRouter.path) {
                if let startScreen = appRouter.startScreen {
                    appRouter.build(startScreen)
                        .navigationDestination(for: Screen.self) { screen in
                            appRouter.build(screen)
                        }
                        .task {
                            try? Tips.resetDatastore() // for debugging
                            try? Tips.configure([
                                .displayFrequency(.immediate),
                                .datastoreLocation(.applicationDefault)
                            ])
                        }
                }
                else {
                    Text("ERROR: View is not routed anywhere!")
                }
            }
            .onAppear {
                let getUserData = getUserData.execute()
                
                switch getUserData {
                    case nil:
                        do {
                            try saveUserData.execute()
                        } catch {
                            debugPrint("Error creating new user:", error)
                        }
                    
                        appRouter.startScreen = .onboarding
                    default:
                        appRouter.startScreen = .main
                }
            }
            .overlay {
                if let notification = appRouter.notification {
                    appRouter.build(notification)
                }
            }

        }
    }
}
