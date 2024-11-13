//
//  RiskProfileView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 10/10/24.
//

import SwiftUI

struct RiskProfileView: View {
    let router: any AppRouterProtocol
    
    // View Model
    @StateObject private var viewModel = RiskProfileViewModel()
    
    var body: some View {
        ZStack {
            Color.background
            
            ZStack {
                ZStack {
                    VStack(spacing: (UIScreen.main.bounds.width < 385) ? 25 : 49) {
                        if viewModel.pageState == .pageQuestion {
                            HanvestProgressBar(
                                value:
                                    $viewModel.progressBarCurrValue,
                                minimum:
                                    viewModel.progressBarMinValue,
                                maximum:
                                    viewModel.progressBarMaxValue
                            )
                            .frame(maxWidth: .infinity)
                        }
                        
                        VStack(spacing: (UIScreen.main.bounds.width < 385) ? 24 : 48) {
                            TabView(selection: $viewModel.currentTab) {
                                HanvestRiskProfileOpeningView()
                                    .tag(RiskProfilePageState.pageOpening.rawValue)
                                    .transition(.slide)
                                    .frame(maxHeight: .infinity, alignment: .top)
                                
                                ForEach(Array(RiskProfileQuestionsAndOptionsPageContent.allCases.enumerated()), id: \.offset) { index, page in
                                    
                                    HanvestMultipleChoiceView(
                                        question: page.questions,
                                        options: page.options,
                                        onSelectAnswer: { answer in
                                            viewModel.userSelectedAnswers[index] = answer
                                        }
                                    )
                                    .tag(page.rawValue)
                                    .transition(.slide)
                                    .frame(maxHeight: .infinity, alignment: .top)
                                    
                                }
                                
                                HanvestRiskProfileResultView(
                                    resultState: viewModel.resultState
                                )
                                .tag(RiskProfilePageState.pageRiskResult.rawValue)
                                .transition(.slide)
                                .frame(maxHeight: .infinity, alignment: .top)
                                .onAppear {
                                    viewModel.getUserRiskProfile()
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
                                        router: self.router
                                    )
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                }
                .padding(.top, viewModel.pageState == .pageQuestion ? 31 : 100)
                .padding(.bottom, (UIScreen.main.bounds.width < 385) ? 30 : 54)
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .padding(.top, (UIScreen.main.bounds.width < 385 ? 0 : 40))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
    
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .onboarding
    
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
