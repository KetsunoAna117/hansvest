//
//  ModuleJourneyView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 12/10/24.
//

import SwiftUI

struct ModuleJourneyView: View {
    let router: any AppRouterProtocol
    
    // Constant
    let maxModulesVisible: Int = 6
    let eachModuleNumberHeight: CGFloat = 100
    let moduleSpacing: CGFloat = 4
    
    // View Model
    @ObservedObject var viewModel: ModuleJourneyViewModel
    
    @ViewBuilder
    var moduleListView: some View {
        VStack(spacing: 4) {
            ForEach(viewModel.moduleProgressList, id: \.moduleID) { module in
                let moduleNumber = viewModel.getModuleIdx(module: module) + 1
                
                HStack {
                    if moduleNumber == 2 {
                        Image("hanvest-app-mascot")
                            .resizable()
                            .frame(width: 79, height: 106)
                            .padding(.trailing, 157.94)
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
                .padding(10)
                .frame(maxWidth: .infinity, alignment: moduleNumberButtonAlignmentLayout(for: moduleNumber))
            }
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .onAppear(){
            viewModel.setup()
        }
    }
    
    var body: some View {
        if viewModel.numberOfModules >= maxModulesVisible {
            ScrollView {
                moduleListView
            }
            .frame(height: countTotalMaxHeightForScrollView())
        } else {
            moduleListView
        }
    }
    
    func moduleNumberButtonAlignmentLayout(for number: Int) -> Alignment {
        let positionInCycle = number % 4
        
        switch positionInCycle {
            case 1, 3:
                return .center
            case 2:
                return .trailing
            case 0:
                return .leading
            default:
                return .center
        }
    }
    
    func countTotalMaxHeightForScrollView() -> CGFloat {
        let totalHeight = CGFloat(maxModulesVisible) * (eachModuleNumberHeight + moduleSpacing) - moduleSpacing
        
        return totalHeight
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
