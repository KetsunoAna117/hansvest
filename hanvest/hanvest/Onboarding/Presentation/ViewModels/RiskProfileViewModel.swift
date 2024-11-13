//
//  RiskProfileViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 11/10/24.
//

import Foundation

class RiskProfileViewModel: ObservableObject {
    @Inject var calculateUserRiskProfile: CalculateUserRiskProfile
    @Inject var saveUserData: SaveUserData
    
    let progressBarMinValue: Int
    let progressBarMaxValue: Int
    
    @Published var currentTab: Int
    @Published var progressBarCurrValue: Int
    @Published var resultState: RiskProfileType ///will be used for segmenting user based on risk profile
    @Published var pageState: RiskProfilePageState
    @Published var userSelectedAnswers: Array<String>
    
    init() {
        self.progressBarMinValue = 0
        self.progressBarMaxValue = 100
        self.currentTab = 0
        self.progressBarCurrValue = 4
        self.resultState = .conservative
        self.pageState = .pageOpening
        self.userSelectedAnswers = Array(repeating: "", count: RiskProfileQuestionsAndOptionsPageContent.allCases.count)
    }
    
    
    func getUserRiskProfile() {
        do {
            let userRiskProfile = try calculateUserRiskProfile.execute(userSelectedAnswers)
            
            resultState = userRiskProfile
        } catch {
            debugPrint("Failed to get user risk profile: \(error.localizedDescription)")
        }
    }
    
    func goToNextPage(router: any AppRouterProtocol) {
        if currentTab < RiskProfilePageState.pageRiskResult.rawValue {
            if !checkIsDisabled() {
                currentTab += 1
                updateProgressBarValue()
                changePageState()
            }
        } else {
            doSaveUserData()
            router.startScreen = .main
            router.popToRoot()
        }
    }
    
    func doSaveUserData() {
        do {
            try saveUserData.execute()
        } catch {
            debugPrint("Error creating new user:", error)
        }
    }
    
    func changePageState() {
        if currentTab < RiskProfilePageState.pageRiskResult.rawValue {
            pageState = .pageQuestion
        } else {
            pageState = .pageRiskResult
        }
    }
    
    func updateProgressBarValue() {
        if pageState == .pageQuestion {
            progressBarCurrValue += (progressBarMaxValue / (RiskProfileQuestionsAndOptionsPageContent.allCases.count - 1))
        }
    }
    
    func checkIsDisabled() -> Bool {
        return pageState == .pageQuestion && userSelectedAnswers[currentTab - 1].isEmpty
    }
}
