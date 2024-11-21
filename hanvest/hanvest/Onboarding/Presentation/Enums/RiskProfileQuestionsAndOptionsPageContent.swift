//
//  RiskProfileQnA.swift
//  hanvest
//
//  Created by Bryan Vernanda on 11/10/24.
//

import Foundation

enum RiskProfileQuestionsAndOptionsPageContent: Int, CaseIterable {
    case page1 = 1
    case page2 = 2
    case page3 = 3
    case page4 = 4
    case page5 = 5
    case page6 = 6
    
    var questions: String {
        switch self {
            case .page1:
                 "Are you new to the stock market?"
            case .page2:
                "How much is your total asset?"
            case .page3:
                "How much do you earn per month?"
            case .page4:
                "What is your goal for investing?"
            case .page5:
                "How will you handle a 15% loss on your investment?"
            case .page6:
                "How long can you leave your money invested?"
        }
    }
    
    var options: [String] {
        switch self {
            case .page1:
                [
                    "Yes, I’m completely new",
                    "I’ve done some research",
                    "I’ve invested a little, but I’m still learning",
                    "I’ve Invested and understand how it work"
                ]
            case .page2:
                [
                    "Less than Rp 50.000.000",
                    "Rp 50.000.000 until Rp 100.000.000",
                    "Rp 100.000.000 until Rp 500.000.000",
                    "More than Rp 500.000.000"
                ]
            case .page3:
                [
                    "Less than Rp 5.000.000",
                    "Rp 5.000.000 until Rp 10.000.000",
                    "Rp 10.000.000 until Rp 50.000.000",
                    "More than Rp 50.000.000"
                ]
            case .page4:
                [
                    "Preserve capital with minimal risk",
                    "Earn steady income with moderate risk",
                    "Grow wealth over time with some risk",
                    "Maximize profit despite high risk involved"
                ]
            case .page5:
                [
                    "Sell everything to cut loss",
                    "Hold and wait for recovery",
                    "Analyze why it happened and adjust",
                    "Invest more to lower cost"
                ]
            case .page6:
                [
                    "Less than 1 year",
                    "1 until 3 years",
                    "4 until 7 years",
                    "More than 7 years"
                ]
        }
    }
}
