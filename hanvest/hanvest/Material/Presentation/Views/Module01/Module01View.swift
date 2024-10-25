//
//  Module01View.swift
//  hanvest
//
//  Created by Bryan Vernanda on 12/10/24.
//

import SwiftUI

struct Module01View: View {
    let router: any AppRouterProtocol
    
    // View Models
    @StateObject var viewModel = Module01ViewModel()
    
    var body: some View {
        ZStack {
            Color.background
            
            if viewModel.plantingViewVisibility == .isVisible {
                Module01PlantingView() {
                    viewModel.plantingViewVisibility = .isHidden
                    viewModel.updateProgressBarValue()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            ZStack {
                VStack(spacing: 49) {
                    ProgressBarWithXMarkView(
                        progressBarMinValue: viewModel.progressBarMinValue,
                        progressBarMaxValue: viewModel.progressBarMaxValue,
                        action: {
                            router.popToRoot()
                        },
                        progressBarCurrValue: $viewModel.progressBarCurrValue
                    )
                    
                    if viewModel.plantingViewVisibility == .isHidden {
                        VStack(spacing: 48) {
                            TabView(selection: $viewModel.currentTab) {
                                
                                ForEach(Array(ContentOfModule01Material.allCases.enumerated()), id: \.offset) { index, content in
                                        
                                        HanvestMaterialnformationView(
                                            title: Text(content.headerContent).font(.nunito(.title2)),
                                            detailText:
                                                content.detailContent
                                        )
                                        .tag(content.rawValue)
                                        .transition(.slide)
                                        .frame(maxHeight: .infinity, alignment: .top)
                                        
                                    }
                                
                            }
                            .frame(maxWidth: .infinity)
                            .tabViewStyle(.page(indexDisplayMode: .never))
                            .indexViewStyle(.page(backgroundDisplayMode: .always))
                            .onAppear {
                                UIScrollView.appearance().isScrollEnabled = false
                            }
                            
                            ZStack {
                                HanvestButtonDefault(
                                    title: "Continue"
                                ) {
                                    viewModel.goToNextPage(
                                        router: self.router,
                                        specificModule: .module01
                                    )
                                    viewModel.updateProgressBarValue()
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.top, 71)
            .padding(.bottom, 54)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .materialModule01
    
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

