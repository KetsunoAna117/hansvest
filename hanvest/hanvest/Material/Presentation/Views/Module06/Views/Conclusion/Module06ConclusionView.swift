//
//  Module06ConclusionView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 27/10/24.
//

import SwiftUI

struct Module06ConclusionView: View {
    let appRouter: any AppRouterProtocol
    let moduleRouter: any Module06RouterProtocol
    
    @ObservedObject var simulationViewModel: Module06SimulationViewModel
    
    var body: some View {
        VStack {
            if let currentStage = simulationViewModel.currentStage {
                Text(currentStage.choiceConclusionTitle)
                    .font(.nunito(.title2, .bold))
                
                VStack(alignment: .leading) {
//                    Text("Penjelasan Terkait Keputusan")
//                        .font(.nunito(.body))
                    Text(currentStage.choiceConclusionContent)
                        .font(.nunito(.body))
                        .padding(.top, 12)
                }
                .padding(.top, 12)
                
                Spacer()
                HanvestButtonDefault(
                    title: "Continue",
                    action: {
                        simulationViewModel.onCompletionModule(appRouter: appRouter)
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
    @Previewable @State var startScreen: Screen? = .materialModule06
    
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
