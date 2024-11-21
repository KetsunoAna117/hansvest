//
//  Module06ConclusionView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 27/10/24.
//

import SwiftUI

struct NewsModuleConclusionView: View {
    let appRouter: any AppRouterProtocol
    let moduleRouter: any NewsModuleRouterProtocol
    
    @ObservedObject var simulationViewModel: NewsModuleSimulationViewModel
    
    var body: some View {
        VStack {
            if let currentStage = simulationViewModel.currentStage {
                Text(currentStage.choiceConclusionTitle)
                    .font(.nunito(.title2, .bold))
                
                VStack(alignment: .leading) {
                    Text(currentStage.choiceConclusionContent)
                        .font(.nunito(.body))
                        .padding(.top, 12)
                }
                .padding(.top, 12)
                
                Spacer()
                HanvestButtonDefault(
                    title: "Continue",
                    action: {
                        simulationViewModel.onConclusionButtonTapped(
                            moduleRouter: moduleRouter,
                            appRouter: appRouter
                        )
                    }
                )
                .padding(.bottom, 54)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .onAppear(){
            moduleRouter.addProgress()
        }
    }
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .materialNewsModule
    
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
