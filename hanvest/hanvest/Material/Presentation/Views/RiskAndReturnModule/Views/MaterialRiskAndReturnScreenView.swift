//
//  Module03View.swift
//  hanvest
//
//  Created by Bryan Vernanda on 17/10/24.
//

import SwiftUI

struct MaterialRiskAndReturnScreenView: View {
    let router: any AppRouterProtocol
    
    // View Model
    @StateObject private var viewModel = RiskAndReturnModuleViewModel()
    
    var body: some View {
        ZStack {
            Color.background
            
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
                    
                    VStack(spacing: (UIScreen.main.bounds.width < 385) ? 20 : 40) {
                        TabView(selection: $viewModel.currentTab) {
                            
                            RiskAndReturnModuleMultipleChoiceView(
                                question: RiskAndReturnModuleMultipleChoicePageContent.page01.question,
                                options: RiskAndReturnModuleMultipleChoicePageContent.page01.options
                            ){ answer in
                                    viewModel.setSelectedProductIndex(answer: answer)
                            }
                            .tag(RiskAndReturnModuleMultipleChoicePageContent.page01.rawValue)
                            .transition(.slide)
                            .frame(maxHeight: .infinity, alignment: .top)
                            
                            ForEach(Array(RiskAndReturnModuleProductOfInvestmentPageContent.allCases.enumerated()), id: \.offset) { index, page in
                                
                                RiskAndReturnModuleProductOfInvestmentView(
                                    title: page.title,
                                    selectedProductIndex: (viewModel.selectedProductIndex != -1) ? viewModel.selectedProductIndex : 0,
                                    productStage: index
                                )
                                .tag(page.rawValue)
                                .transition(.slide)
                                .frame(maxHeight: .infinity, alignment: .top)
                                
                            }
                            
                            ForEach(Array(RiskAndReturnModuleMaterialInformationPageContent.allCases.enumerated()), id: \.offset) { index, page in
                                
                                HanvestMaterialInformationView(
                                    title: Text(page.title).font(.nunito(.title2)),
                                    detailText: page.detailText,
                                    imageNames: (page == .page05) ? ["high-risk-low-risk-triangle"] : nil,
                                    pointListStyle: .bulleted,
                                    pointListContents: page.bulletPoints
                                )
                                .tag(page.rawValue)
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
                                style: .filled(isDisabled: viewModel.checkIsDisabled()),
                                title: viewModel.pageState.buttonStringValue
                            ) {
                                viewModel.goToNextPage(
                                    router: self.router,
                                    specificModule: .riskAndReturnModule
                                )
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.top, (UIScreen.main.bounds.width < 385) ? 16 : 56)
            .padding(.bottom, (UIScreen.main.bounds.width < 385) ? 30 : 54)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .materialRiskAndReturnModule
    
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
