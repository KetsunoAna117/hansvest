//
//  Module04ViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 19/10/24.
//

import Foundation

class Module04ViewModel: ObservableObject {
    @Inject var validateIfUserHasCompletedTheModule: ValidateIfUserHasCompletedTheModule
    
    let progressBarMinValue: Int = 0
    let progressBarMaxValue: Int = 100
    let lastPage = Module04NumberedListContent.page11.rawValue
    
    @Published var currentTab: Int = 0
    @Published var progressBarCurrValue: Int = 4
    @Published var pageState: Module04PageState = .pageStartQuiz
    @Published var showingAnswer: Module04ShowingCorrectOrWrongAnswer = .isNotShowing
    @Published var userSelectedAnswer: String = ""
    
    
    func directToCompletionPage(router: any AppRouterProtocol, specificModule: CompletionEntityType) {
        do {
            let isModuleCompleted = try validateIfUserHasCompletedTheModule.execute(specificModule: specificModule)
                
            if isModuleCompleted {
                router.popToRoot()
            } else {
                router.push(.moduleCompletion(completionItem: specificModule))
            }
        }
        catch {
            debugPrint("Failed to direct to completion page: \(error.localizedDescription)")
        }
    }
    
    func goToNextPage(router: any AppRouterProtocol, specificModule: CompletionEntityType) {
        if currentTab < lastPage {
            if !checkIsDisabled() {
                currentTab += 1
                updateProgressBarValue()
                resetUserSelectedAnswer()
            }
        } else {
            directToCompletionPage(router: router, specificModule: specificModule)
        }
    }
    
    func changePageState() {
        switch currentTab {
            default:
                pageState = .pageContinue
        }
    }
    
    func updateProgressBarValue() {
        progressBarCurrValue += (progressBarMaxValue / lastPage)
    }
    
    func checkIsDisabled() -> Bool {
        return (userSelectedAnswer.isEmpty && checkIsCurrentPageAQuestion())
    }
    
    func checkIsCurrentPageAQuestion() -> Bool {
        return (Module04MultipleChoice.allCases.contains { $0.rawValue == currentTab })
    }
    
    func toggleShowingAnswer() {
        showingAnswer.toggle()
    }
    
    func parseUserAnswerIfIsWrong(page: Module04MultipleChoice) -> String? {
        if userSelectedAnswer != page.answers {
            return userSelectedAnswer
        } else {
            return nil
        }
    }
    
    func checkUserAnswerTrueOrFalse(currentTab: Int) -> Bool {
        if let currentPage = Module04MultipleChoice(rawValue: currentTab) {
            return userSelectedAnswer == currentPage.answers
        } else {
            return false
        }
    }
    
    func resetUserSelectedAnswer() {
        userSelectedAnswer = ""
    }
}
