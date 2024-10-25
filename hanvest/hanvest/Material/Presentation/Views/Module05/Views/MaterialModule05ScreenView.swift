//
//  MaterialModule05ScreenView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 24/10/24.
//

import SwiftUI

struct MaterialModule05ScreenView: View {
    // CONSTANT
    let MIN_PROGRESS = 0
    let MAX_PROGRESS = 6
    
    let appRouter: any AppRouterProtocol
    
    @StateObject private var contentRouter = Module05Router()
    @StateObject private var simulationViewModel = Module05SimulationViewModel()
    @StateObject private var profileViewModel = Module05ProfileViewModel()
    
    var body: some View {
        VStack {
            ProgressBarWithXMarkView(
                progressBarMinValue: MIN_PROGRESS,
                progressBarMaxValue: MAX_PROGRESS,
                action: {
                    appRouter.popToRoot()
                },
                progressBarCurrValue: $contentRouter.progress
            )
            .padding(.horizontal, 20)
            
            VStack {
                if let content = contentRouter.content.last {
                    contentRouter.build(content)
                }
            }
            .onAppear(){
                if contentRouter.content.count <= 0 {
                    contentRouter.content.append(
                        .buyStage(
                            profileViewModel: profileViewModel,
                            simulationViewModel: simulationViewModel
                        )
                    )
                }
                
                if simulationViewModel.stockList.count <= 0 {
                    simulationViewModel.setup()
                }
                
                if profileViewModel.userData == nil {
                    profileViewModel.setup()
                }
            }
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
        
    }
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .materialModule05
    
    NavigationStack(path: $appRouter.path) {
        if let startScreen = startScreen {
            appRouter.build(startScreen)
                .navigationDestination(for: Screen.self) { screen in
                    appRouter.build(screen)
                }
        }
    }
}
