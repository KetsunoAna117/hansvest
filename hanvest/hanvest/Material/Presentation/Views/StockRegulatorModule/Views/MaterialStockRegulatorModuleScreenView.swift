//
//  Module04View.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

struct MaterialStockRegulatorModuleScreenView: View {
    let router: any AppRouterProtocol
    
    // View Model
    @StateObject private var viewModel = StockRegulatorModuleViewModel()
    
    var body: some View {
        ZStack {
            Color.background
            
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
                    .padding(.horizontal, (viewModel.showingAnswer == .isShowing) ? 20 : 0)
                    
                    VStack(spacing: 48) {
                        TabView(selection: $viewModel.currentTab) {
                            
                            ForEach(Array(StockRegulatorModuleMaterialInformationPageContent.allCases.enumerated()), id: \.offset) { index, page in
                                
                                HanvestMaterialnformationView(
                                    title: Text(page.title).font(.nunito(.title2, .bold)),
                                    detailText: page.detailText,
                                    image: [page.image]
                                )
                                .tag(page.rawValue)
                                .transition(.slide)
                                .frame(maxHeight: .infinity, alignment: .top)
                                
                            }
                            
                            ForEach(Array(StockRegulatorModuleMultipleChoicePageContent.allCases.enumerated()), id: \.offset) { index, page in
                                
                                HanvestMultipleChoiceView(
                                    question: page.questions,
                                    options: page.options,
                                    image: page.image,
                                    correctAnswer: (viewModel.showingAnswer == .isShowing) ? page.answers : nil,
                                    wrongAnswer: (viewModel.showingAnswer == .isShowing) ? viewModel.parseUserAnswerIfIsWrong(page: page) : nil,
                                    onSelectAnswer: { answer in
                                        viewModel.userSelectedAnswer = answer
                                    }
                                )
                                .tag(page.rawValue)
                                .transition(.slide)
                                .padding(.horizontal, (viewModel.showingAnswer == .isShowing) ? 20 : 0)
                                .frame(maxHeight: .infinity, alignment: .top)
                                
                            }
                            
                            HanvestMaterialnformationView(
                                title: StockRegulatorModuleNumberedListPageContent.page11.title,
                                detailText: StockRegulatorModuleNumberedListPageContent.page11.detailText,
                                image: StockRegulatorModuleNumberedListPageContent.page11.image,
                                pointListStyle: .numbered,
                                pointListContents: StockRegulatorModuleNumberedListPageContent.page11.numberedLists
                            )
                            .tag(StockRegulatorModuleNumberedListPageContent.page11.rawValue)
                            .transition(.slide)
                            .frame(maxHeight: .infinity, alignment: .top)
                            
                        }
                        .frame(maxWidth: .infinity)
                        .tabViewStyle(.page(indexDisplayMode: .never))
                        .indexViewStyle(.page(backgroundDisplayMode: .always))
                        .onAppear {
                            UIScrollView.appearance().isScrollEnabled = false
                        }
                        
                        ZStack {
                            if viewModel.showingAnswer == .isNotShowing {
                                HanvestButtonDefault(
                                    style: .filled(
                                        isDisabled: viewModel.checkIsDisabled(isButtonStyle: true)
                                    ),
                                    title: viewModel.pageState.buttonStringValue
                                ) {
                                    if viewModel.checkIsDisabled(isButtonStyle: false) {
                                        viewModel.showingAnswer = .isShowing
                                    } else {
                                        viewModel.goToNextPage(
                                            router: self.router,
                                            specificModule: .module04
                                        )
                                    }
                                }
                            } else {
                                HanvestConfirmationFeedbackView(
                                    state: (
                                        viewModel.checkUserAnswerTrueOrFalse()
                                    ) ? .correct : .incorrect, action: {
                                        viewModel.goToNextPage(
                                            router: self.router,
                                            specificModule: .module04
                                        )

                                        viewModel.showingAnswer = .isNotShowing
                                    }
                                )
                            }
                        }
                        .frame(maxWidth: .infinity)
                        
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.top, (UIScreen.main.bounds.width < 385) ? 31 : 71)
            .padding(.bottom, (viewModel.showingAnswer == .isNotShowing) ? 54 : 0)
            .padding(.horizontal, (viewModel.showingAnswer == .isNotShowing) ? 20 : 0)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .materialModule04
    
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
