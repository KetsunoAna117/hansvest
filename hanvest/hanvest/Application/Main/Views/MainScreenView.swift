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
        VStack(spacing: 0) {
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
            .accessibilityElement(children: .contain)
            .accessibilityLabel("toolbar")
            
            Divider()
            
            TabView(selection: $selectionTab) {
                Tab("Material",
                    systemImage: "books.vertical",
                    value: .material
                ) {
                    ZStack {
                        Color.background.ignoresSafeArea()
                        HanvestMaterialScreenView(router: router)
                    }
                    .accessibilityLabel("Material tab. Contains learning materials.")
                }
                
                Tab("Simulation",
                    systemImage: "chart.xyaxis.line",
                    value: .simulation
                ) {
                    ZStack {
                        Color.background.ignoresSafeArea()
                        HanvestSimulationView(
                            router: router,
                            userDataViewModel: userDataViewModel,
                            simulationViewModel: simulationViewModel
                        )
                    }
                    .accessibilityLabel("Simulation tab. Contains stock simulation tools.")
                }
                
//                Tab("My Land",
//                    systemImage: "globe.americas",
//                    value: .land
//                ) {
//                    ZStack {
//                        Color.background.ignoresSafeArea()
//                        HanvestLandScreenView()
//                    }
//                    .accessibilityLabel("My Land tab. Displays information about your portofolio.")
//                }
            }
            .transition(.slide)
            .animation(.easeInOut, value: selectionTab)
            .accessibilityElement(children: .contain)
            .accessibilityLabel("navigation bar")
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
