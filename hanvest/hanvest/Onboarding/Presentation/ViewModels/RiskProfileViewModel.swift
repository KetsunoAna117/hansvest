//
//  RiskProfileViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 11/10/24.
//

import Foundation

class RiskProfileViewModel: ObservableObject {
    @Inject var calculateUserRiskProfile: CalculateUserRiskProfile
    
    let progressBarMinValue: Int = 0
    let progressBarMaxValue: Int = 100
    
    var resultState: RiskProfileType = .conservative // will be implemented later
    
    @Published var pageState: RiskProfilePageState = .pageOpening
    @Published var currentTab: Int = 0
    @Published var progressBarCurrValue: Int = 4
    @Published var userSelectedAnswers = Array(repeating: "", count: RiskProfileQuestionsAndOptions.allCases.count)
    
    
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
            if currentTab == (RiskProfilePageState.pageRiskResult.rawValue - 1) {
                getUserRiskProfile()
            }
            
            if !checkIsDisabled() {
                currentTab += 1
                updateProgressBarValue()
            }
        } else {
            router.startScreen = .main
            router.popToRoot()
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
            progressBarCurrValue += (progressBarMaxValue / RiskProfileQuestionsAndOptions.allCases.count)
        }
    }
    
    func checkIsDisabled() -> Bool {
        return pageState == .pageQuestion && userSelectedAnswers[currentTab - 1].isEmpty
    }
}
