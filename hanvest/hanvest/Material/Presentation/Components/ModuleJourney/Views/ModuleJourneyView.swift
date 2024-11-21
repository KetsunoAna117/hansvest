//
//  ModuleJourneyView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 12/10/24.
//

import SwiftUI

struct ModuleJourneyView: View {
    let router: any AppRouterProtocol
    
    // View Model
    @ObservedObject var viewModel: ModuleJourneyViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 4) {
                ForEach(viewModel.moduleProgressList, id: \.moduleID) { module in
                    let moduleNumber = viewModel.getModuleIdx(module: module) + 1
                    
                    HStack {
                        if moduleNumber == 2 {
                            Image("hanvest-app-mascot")
                                .resizable()
                                .frame(width: 78, height: 106)
                            
                            Spacer()
                        }
                        
                        HanvestModuleNumberButton(
                            style: module.state,
                            number: moduleNumber,
                            action: {
                                router.presentOverlay(
                                    .withHanvestPopupButton(
                                        title: module.popup.title,
                                        desc: module.popup.desc,
                                        buttonAction: {
                                            router.push(module.moduleScreenID)
                                        }
                                    )
                                )
                            }
                        )
                    }
                    .safeAreaPadding(10)
                    .frame(maxWidth: .infinity, alignment: moduleNumberButtonAlignmentLayout(for: moduleNumber))
                }
            }
            .safeAreaPadding(.horizontal, 20)
            .frame(maxWidth: .infinity)
            .onAppear(){
                viewModel.setup()
            }
        }
        .scrollIndicators(.hidden)
    }
    
    func moduleNumberButtonAlignmentLayout(for number: Int) -> Alignment {
        let positionInCycle = number % 4
        
        switch positionInCycle {
            case 0:
                return .leading
            case 2:
                return .trailing
            default:
                return .center
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
        }
    }
}
