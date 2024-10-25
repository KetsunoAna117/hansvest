//
//  Module04ViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 19/10/24.
//

import Foundation

class Module03ViewModel: ObservableObject {
    @Inject var validateIfUserHasCompletedTheModule: ValidateIfUserHasCompletedTheModule
    
    let progressBarMinValue: Int = 0
    let progressBarMaxValue: Int = 100
    let lastPage = Module03MaterialInformationContent.page06.rawValue
    
    @Published var currentTab: Int = 0
    @Published var progressBarCurrValue: Int = 4
    @Published var pageState: Module03PageState = .pageContinue
    @Published var selectedProductIndex: Int = -1
    
    
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
            }
        } else {
            directToCompletionPage(router: router, specificModule: specificModule)
        }
    }
    
    func changePageState() {
        switch currentTab {
            case Module03ProductOfInvestmentContent.page02.rawValue...Module03ProductOfInvestmentContent.page03.rawValue:
                pageState = .pageNextMonth
            default:
                pageState = .pageContinue
        }
    }
    
    func updateProgressBarValue() {
        progressBarCurrValue += (progressBarMaxValue / lastPage)
    }
    
    func checkIsDisabled() -> Bool {
        return (selectedProductIndex == -1) && (currentTab == Module03MultipleChoice.page01.rawValue)
    }
    
    func checkSelectedProductIndex(answer: String) {
        for optionCase in Module03MultipleChoice.allCases {
            if let index = optionCase.options.firstIndex(of: answer) {
                self.selectedProductIndex = index
                return
            }
        }
    }
}
