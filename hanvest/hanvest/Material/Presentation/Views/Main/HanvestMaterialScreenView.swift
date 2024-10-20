//
//  HanvestMaterialScreenView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 16/10/24.
//

import SwiftUI

struct HanvestMaterialScreenView: View {
    let router: any AppRouterProtocol
    
    @StateObject private var viewmodel: ModuleJourneyViewModel = .init()
    
    var body: some View {
        VStack {
            ModuleJourneyView(router: router, viewModel: viewmodel)
            Divider()
        }
    }
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .main
    
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
