//
//  Module03View.swift
//  hanvest
//
//  Created by Bryan Vernanda on 17/10/24.
//

import SwiftUI

struct Module03View: View {
    let router: any AppRouterProtocol
    
    // Constants
    let progressBarMinValue: Int = 0
    let progressBarMaxValue: Int = 100
    let lastPage = Module03MaterialInformationContent.page06.rawValue
    
    @State private var currentTab: Int = 0
    @State private var progressBarCurrValue: Int = 4
    @State private var pageState: Module03PageState = .pageContinue
    
    // View Model
    @StateObject private var viewModel = Module03ViewModel()
    
    var body: some View {
        ZStack {
            Color.background
            
            ZStack {
                VStack(spacing: 49) {
                    ProgressBarWithXMarkView(
                        progressBarMinValue: progressBarMinValue,
                        progressBarMaxValue: progressBarMaxValue,
                        action: {
                            router.popToRoot()
                        },
                        progressBarCurrValue: $progressBarCurrValue
                    )
                    
                    VStack(spacing: 48) {
                        TabView(selection: $currentTab) {
                            
                            HanvestMultipleChoice(
                                question: Module03MultipleChoice.page01.question,
                                options: Module03MultipleChoice.page01.options){ answer in
                                    viewModel.checkSelectedProductIndex(answer: answer)
                            }
                            .tag(Module03MultipleChoice.page01.rawValue)
                            .transition(.slide)
                            .frame(maxHeight: .infinity, alignment: .top)
                            
                            if viewModel.selectedProductIndex != -1 {
                                ForEach(Array(Module03ProductOfInvestmentContent.allCases.enumerated()), id: \.offset) { index, page in
                                    
                                    HanvestModule03AllProductOfInvestmentView(
                                        title: page.title,
                                        selectedProductIndex: viewModel.selectedProductIndex,
                                        productStage: page.rawValue - 1
                                    )
                                    .tag(page.rawValue)
                                    .transition(.slide)
                                    .frame(maxHeight: .infinity, alignment: .top)
                                    
                                }
                            }
                            
                            ForEach(Array(Module03MaterialInformationContent.allCases.enumerated()), id: \.offset) { index, page in
                                
                                HanvestMaterialnformationView(
                                    title: Text(page.title).font(.nunito(.title2)),
                                    detailText: page.detailText,
                                    image: (page == .page05) ? [Image("high-risk-low-risk-triangle")] : nil,
                                    bulletPoints: page.bulletPoints
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
                                style: .filled(isDisabled: checkIsDisabled()),
                                title: pageState.buttonStringValue
                            ) {
                                goToNextPage()
                                changePageState()
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.top, 71)
            .padding(.bottom, 54)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func goToNextPage() {
        if currentTab < lastPage {
            if !checkIsDisabled() {
                currentTab += 1
                updateProgressBarValue()
            }
        } else {
            router.push(.moduleCompletion(completionItem: .module03))
        }
    }
    
    private func changePageState() {
        switch currentTab {
            case Module03ProductOfInvestmentContent.page02.rawValue...Module03ProductOfInvestmentContent.page03.rawValue:
                pageState = .pageNextMonth
            default:
                pageState = .pageContinue
        }
    }
    
    private func updateProgressBarValue() {
        progressBarCurrValue += (progressBarMaxValue / lastPage)
    }
    
    private func checkIsDisabled() -> Bool {
        return (viewModel.selectedProductIndex == -1) && (currentTab == Module03MultipleChoice.page01.rawValue)
    }
    
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .materialModule03
    
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
