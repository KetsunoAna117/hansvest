//
//  MaterialModule06ScreenView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 26/10/24.
//

import SwiftUI

struct MaterialModule06ScreenView: View {
    // CONSTANT
    let MIN_PROGRESS = 0
    let MAX_PROGRESS = 2
    
    let appRouter: any AppRouterProtocol
    
    var body: some View {
        Text("Hello, from Module 06!")
    }
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .materialModule06
    
    NavigationStack(path: $appRouter.path) {
        if let startScreen = startScreen {
            appRouter.build(startScreen)
                .navigationDestination(for: Screen.self) { screen in
                    appRouter.build(screen)
                }
        }
    }
}
