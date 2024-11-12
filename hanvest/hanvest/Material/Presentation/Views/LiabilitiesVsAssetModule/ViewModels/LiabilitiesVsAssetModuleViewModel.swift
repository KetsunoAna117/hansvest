//
//  Module02ViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 16/10/24.
//

import Foundation

class LiabilitiesVsAssetModuleViewModel: ObservableObject {
    @Inject var validateIfUserHasCompletedTheModule: ValidateIfUserHasCompletedTheModule
    
    let progressBarMinValue: Int
    let progressBarMaxValue: Int
    let lastPage: Int
    
    @Published var currentTab: Int
    @Published var progressBarCurrValue: Int
    @Published var pageState: LiabilitiesVsAssetModulePageState
    @Published var userSelectedAnswers: Array<String>
    
    init() {
        self.progressBarMinValue = 0
        self.progressBarMaxValue = 100
        self.lastPage = LiabilitiesVsAssetModuleHeaderWithDetailTextPageContent.page10.rawValue
        self.currentTab = 0
        self.progressBarCurrValue = 4
        self.pageState = .pageContinue
        self.userSelectedAnswers = Array(repeating: "", count: LiabilitiesVsAssetModuleHeaderWithDetailTextPageContent.page10.rawValue)
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
            case LiabilitiesVsAssetModuleTextImagePageContent.page06.rawValue:
                pageState = .pageCheckout
            case LiabilitiesVsAssetModuleMultipleChoicePageContent.page07.rawValue:
                pageState = .pagePay
            default:
                pageState = .pageContinue
        }
    }
    
    func updateProgressBarValue() {
        progressBarCurrValue += (progressBarMaxValue / lastPage)
    }
    
    func checkIsDisabled() -> Bool {
        guard currentTab < userSelectedAnswers.count else {
            return false
        }
        
        let isPage04 = (currentTab == LiabilitiesVsAssetModuleTextImageColorPickerPageContent.page04.rawValue)
        let isChoicePage = LiabilitiesVsAssetModuleMultipleChoicePageContent.allCases.contains(where: { $0.rawValue == currentTab })
        let isAnswerEmpty = userSelectedAnswers[currentTab].isEmpty
        
        return (isPage04 || isChoicePage) && isAnswerEmpty
    }
    
}
