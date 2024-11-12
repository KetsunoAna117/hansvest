//
//  MainScreen.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 16/10/24.
//

import SwiftUI

struct MainScreenView: View {
    let router: any AppRouterProtocol
    
    @State private var selectionTab: HanvestMainViewTabSelection = .material
    @StateObject var simulationViewModel = LocalSimulationViewModel()
    @StateObject var userDataViewModel: HanvestLoadedUserDataViewModel = .init()
    @StateObject private var highlightViewModel = HanvestHighlightViewModel()
    
    var body: some View {
        VStack {
            HanvestHeaderView(
                userDataViewModel: userDataViewModel,
                bookIconTappedAction: {
                    debugPrint("Book Icon Tapped")
                    router.push(.glossary)
                },
                bellIconTappedAction: {
                    debugPrint("Bell Icon Tapped")
                    router.push(.news(userViewModel: userDataViewModel))
                },
                profileIconTappedAction: {
                    debugPrint("Profile Account Tapped")
                    router.push(.profile)
                }
            )
            
            TabView(selection: $selectionTab) {
                // Material View
                ZStack {
                    Color.background.ignoresSafeArea()
                    HanvestMaterialScreenView(router: router)
                }
                .tag(HanvestMainViewTabSelection.material)
                
                // Simulation View
                ZStack {
                    Color.background.ignoresSafeArea()
                    HanvestSimulationView(
                        router: router,
                        userDataViewModel: userDataViewModel,
                        simulationViewModel: simulationViewModel
                    )
                }
                .tag(HanvestMainViewTabSelection.simulation)
                
                // Land View
                ZStack {
                    Color.background.ignoresSafeArea()
                    HanvestLandScreenView()
                }
                .tag(HanvestMainViewTabSelection.land)
            }
        }
        .onAppear {
            UIScrollView.appearance().isScrollEnabled = true
            
            userDataViewModel.setup()
            
            if !userDataViewModel.isHighlightEverShown {
                highlightViewModel.stage = HanvestMainViewHighlightStage.mainStage.stringValue
                userDataViewModel.toggleHighlightEverShown()
            }
            
            if simulationViewModel.stockList.isEmpty {
                simulationViewModel.setup(
                    appRouter: router,
                    loadedUserViewModel: userDataViewModel
                )
            }
        }
        .modifier(HanvestHighlightHelperView(viewModel: highlightViewModel))
        .animation(.easeInOut, value: selectionTab)
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
    .overlay {
        if let notification = appRouter.notification {
            appRouter.build(notification)
        }
    }
    .overlay {
        if let popup = appRouter.popup {
            ZStack {
                appRouter.build(popup)
            }
            // Apply transition and animation
            .transition(.opacity) // You can use other transitions like .scale, .move, etc.
            .animation(.easeInOut(duration: 0.1), value: appRouter.popup)
        }
    }
}
