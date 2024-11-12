//
//  CalculateUserRiskProfile.swift
//  hanvest
//
//  Created by Bryan Vernanda on 25/10/24.
//

protocol CalculateUserRiskProfile {
    func execute(_ userSelectedAnswers: [String]) throws -> RiskProfileType
}

struct CalculateUserRiskProfileImpl: CalculateUserRiskProfile {
    
    func execute(_ userSelectedAnswers: [String]) throws -> RiskProfileType {
        var total = 0
        
        for (index, answer) in userSelectedAnswers.enumerated() {
            if let specificPageOption = RiskProfileQuestionsAndOptionsPageContent(rawValue: (index + 1)) {
                if let optionIndex = specificPageOption.options.firstIndex(of: answer) {
                    total += (optionIndex + 1)
                }
            }
        }

        switch total {
            case 6...8:
                return .conservative
            case 9...15:
                return .moderate
            case 16...20:
                return .aggresive
            case 21...24:
                return .veryAggresive
            default:
                return .conservative
        }
        
    }
}
