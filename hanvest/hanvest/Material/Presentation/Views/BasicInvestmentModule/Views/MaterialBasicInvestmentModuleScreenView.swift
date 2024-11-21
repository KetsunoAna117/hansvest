//
//  Module01View.swift
//  hanvest
//
//  Created by Bryan Vernanda on 12/10/24.
//

import SwiftUI

struct MaterialBasicInvestmentModuleScreenView: View {
    let router: any AppRouterProtocol
    
    // View Models
    @StateObject private var viewModel = BasicInvestmentModuleViewModel()
    @StateObject private var highlightViewModel = HanvestHighlightViewModel()
    
    var body: some View {
        ZStack {
            Color.background
            
            if viewModel.plantingViewVisibility == .isVisible {
                BasicInvestmentModulePlantingView(highlightViewModel: highlightViewModel) {
                    viewModel.plantingViewVisibility = .isHidden
                    viewModel.updateProgressBarValue()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            ZStack {
                VStack(spacing: (UIScreen.main.bounds.width < 385) ? 20 : 40) {
                    ProgressBarWithXMarkView(
                        progressBarMinValue: viewModel.progressBarMinValue,
                        progressBarMaxValue: viewModel.progressBarMaxValue,
                        action: {
                            router.popToRoot()
                        },
                        progressBarCurrValue: $viewModel.progressBarCurrValue
                    )
                    .padding(.horizontal, -8)
                    
                    if viewModel.plantingViewVisibility == .isHidden {
                        VStack(spacing: (UIScreen.main.bounds.width < 385) ? 24 : 48) {
                            TabView(selection: $viewModel.currentTab) {
                                
                                ForEach(Array(BasicInvestmentModuleContent.allCases.enumerated()), id: \.offset) { index, content in
                                        
                                        HanvestMaterialInformationView(
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
                                        specificModule: .basicInvestmentModule
                                    )
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.top, (UIScreen.main.bounds.width < 385) ? 16 : 56)
            .padding(.bottom, (UIScreen.main.bounds.width < 385) ? 30 : 54)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            viewModel.setupPlantingViewVisibility()
        }
        .modifier(HanvestHighlightHelperView(viewModel: highlightViewModel))
    }
    
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .materialBasicInvestmentModule
    
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

