//
//  Module04View.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

struct Module04View: View {
    let router: any AppRouterProtocol
    
    // Constants
    let progressBarMinValue: Int = 0
    let progressBarMaxValue: Int = 100
    let lastPage = Module04NumberedListContent.page11.rawValue
    
    @State private var currentTab: Int = 0
    @State private var progressBarCurrValue: Int = 4
    @State private var pageState: Module04PageState = .pageStartQuiz
    @State private var showingAnswer: Module04ShowingCorrectOrWrongAnswer = .isNotShowing
    
    // View Model
    @StateObject private var viewModel = Module04ViewModel()
    
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
                    .padding(.horizontal, (showingAnswer == .isShowing) ? 20 : 0)
                    
                    VStack(spacing: 48) {
                        TabView(selection: $currentTab) {
                            
                            ForEach(Array(Module04MaterialInformationContent.allCases.enumerated()), id: \.offset) { index, page in
                                
                                HanvestMaterialnformationView(
                                    title: Text(page.title).font(.nunito(.title2, .bold)),
                                    detailText: page.detailText,
                                    image: [page.image]
                                )
                                .tag(page.rawValue)
                                .transition(.slide)
                                .frame(maxHeight: .infinity, alignment: .top)
                                
                            }
                            
                            ForEach(Array(Module04MultipleChoice.allCases.enumerated()), id: \.offset) { index, page in
                                
                                HanvestMultipleChoice(
                                    question: page.questions,
                                    options: page.options,
                                    image: page.image,
                                    correctAnswer: (showingAnswer == .isShowing) ? page.answers : nil,
                                    wrongAnswer: (showingAnswer == .isShowing) ? viewModel.parseUserAnswerIfIsWrong(page: page) : nil,
                                    onSelectAnswer: { answer in
                                        viewModel.userSelectedAnswer = answer
                                    }
                                )
                                .tag(page.rawValue)
                                .transition(.slide)
                                .frame(maxHeight: .infinity, alignment: .top)
                                
                            }
                            
                            HanvestMaterialnformationView(
                                title: Module04NumberedListContent.page11.title,
                                detailText: Module04NumberedListContent.page11.detailText,
                                image: Module04NumberedListContent.page11.image,
                                numberedList: Module04NumberedListContent.page11.numberedLists
                            )
                            .tag(Module04NumberedListContent.page11.rawValue)
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
                            if showingAnswer == .isNotShowing {
                                HanvestButtonDefault(
                                    style: .filled(isDisabled: checkIsDisabled()),
                                    title: pageState.buttonStringValue
                                ) {
                                    if checkIsCurrentPageAQuestion() {
                                        toggleShowingAnswer()
                                    } else {
                                        goToNextPage()
                                        changePageState()
                                    }
                                }
                            } else {
                                HanvestConfirmationFeedbackView(
                                    state: (viewModel.checkUserAnswerTrueOrFalse(currentTab: currentTab)) ? .correct : .incorrect, action: {
                                        toggleShowingAnswer()
                                        goToNextPage()
                                        changePageState()
                                    }
                                )
                            }
                        }
                        .frame(maxWidth: .infinity)
                        
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.top, 71)
            .padding(.bottom, (showingAnswer == .isNotShowing) ? 54 : 0)
            .padding(.horizontal, (showingAnswer == .isNotShowing) ? 20 : 0)
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
                viewModel.resetUserSelectedAnswer()
            }
        } else {
            router.push(.moduleCompletion(completionItem: .module04))
        }
    }
    
    private func changePageState() {
        switch currentTab {
            default:
                pageState = .pageContinue
        }
    }
    
    private func updateProgressBarValue() {
        progressBarCurrValue += (progressBarMaxValue / lastPage)
    }
    
    private func checkIsDisabled() -> Bool {
        return (viewModel.userSelectedAnswer.isEmpty && checkIsCurrentPageAQuestion())
    }
    
    private func checkIsCurrentPageAQuestion() -> Bool {
        return (Module04MultipleChoice.allCases.contains { $0.rawValue == currentTab })
    }
    
    private func toggleShowingAnswer() {
        showingAnswer.toggle()
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
