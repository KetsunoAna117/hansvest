//
//  UserDataCardViewModel.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 17/10/24.
//

import Foundation

class UserDataCardViewModel: ObservableObject{
    @Inject var getUserData: GetUserData
    
    @Published var username: String
    @Published var riskProfileStatus: RiskProfileType
    @Published var todayEquity: Int
    @Published var yesterdayEquity: Int
    @Published var percentage: Int = 0
    
    init() {
        self.username = ""
        self.riskProfileStatus = .moderate
        self.todayEquity = 0
        self.yesterdayEquity = 0
    }
    
    func setup(
        todayEquity: Int = 0,
        yesterdayEquity: Int = 0
    ){
        if let user = getUserData.execute() {
            self.username = user.userName
            self.riskProfileStatus = user.userRiskProfile
        }
        self.todayEquity = todayEquity
        self.yesterdayEquity = yesterdayEquity
        calculateEquityPercentage()
    }
    
    func calculateEquityPercentage(){
        guard yesterdayEquity != 0 else {
            self.percentage = 0
            return
        }
        let percentageChange = Double(todayEquity - yesterdayEquity) / Double(yesterdayEquity) * 100
        self.percentage = Int(percentageChange)
    }
    
    func determineLabelState() -> HanvestProfitLossLabelDefaultState{
        if todayEquity > yesterdayEquity {
            return .Profit
        } else if todayEquity < yesterdayEquity {
            return .Loss
        } else {
            return .NoChange
        }
    }
}
