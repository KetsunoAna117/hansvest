//
//  Module04ViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 19/10/24.
//

import Foundation

class RiskAndReturnModuleViewModel: ObservableObject {
    @Inject var validateIfUserHasCompletedTheModule: ValidateIfUserHasCompletedTheModule
    
    let progressBarMinValue: Int
    let progressBarMaxValue: Int
    let lastPage: Int
    
    @Published var currentTab: Int
    @Published var progressBarCurrValue: Int
    @Published var pageState: RiskAndReturnModulePageState
    @Published var selectedProductIndex: Int
    
    init() {
        self.progressBarMinValue = 0
        self.progressBarMaxValue = 100
        self.lastPage = RiskAndReturnModuleMaterialInformationPageContent.page06.rawValue
        self.currentTab = 0
        self.progressBarCurrValue = 4
        self.pageState = .pageContinue
        self.selectedProductIndex = -1
    }
    
    
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
                changePageState()
            }
        } else {
            directToCompletionPage(router: router, specificModule: specificModule)
        }
    }
    
    func changePageState() {
        switch currentTab {
            case RiskAndReturnModuleProductOfInvestmentPageContent.page02.rawValue...RiskAndReturnModuleProductOfInvestmentPageContent.page03.rawValue:
                pageState = .pageNextMonth
            default:
                pageState = .pageContinue
        }
    }
    
    func updateProgressBarValue() {
        progressBarCurrValue += (progressBarMaxValue / lastPage)
    }
    
    func checkIsDisabled() -> Bool {
        return (selectedProductIndex == -1) && (currentTab == RiskAndReturnModuleMultipleChoicePageContent.page01.rawValue)
    }
    
    func setSelectedProductIndex(answer: String) {
        for optionCase in RiskAndReturnModuleMultipleChoicePageContent.allCases {
            if let index = optionCase.options.firstIndex(of: answer) {
                self.selectedProductIndex = index
                return
            }
        }
    }
}
