//
//  Module04MultipleChoice.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

enum Module04MultipleChoice: Int, CaseIterable {
    case page02 = 1
    case page04 = 3
    case page06 = 5
    case page08 = 7
    case page09 = 8
    case page10 = 9
    
    var questions: String {
        switch self {
            case .page02:
                "What is a stock?"
            case .page04:
                "Which market helps companies raise funds by selling shares?"
            case .page06:
                "Which market helps companies raise funds by selling shares?"
            case .page08, .page09, .page10:
                "What is the function of these organizations?"
        }
    }
    
    var options: [String] {
        switch self {
            case .page02:
                [
                    "An ownership instrument in a company",
                    "A type of debt issued by companies",
                    "A government-issued security",
                    "Professional pooled investment"
                ]
            case .page04:
                [
                    "Stocks provide ownership of  company, while bonds represent a loan to issuer",
                    "Stocks have fixed returns, while bonds are subject to market fluctuations."
                ]
            case .page06:
                [
                    "They facilitate the acquisition of funds for company expansion and innovation.",
                    "They provide guaranteed returns for all investments."
                ]
            case .page08:
                [
                    "A platform for buying and selling securities.",
                    "clearing stock exchange settlements",
                    "Ensures efficient transactions under Indonesian law."
                ]
            case .page09:
                [
                    "A platform for buying and selling securities.",
                    "clearing stock exchange settlements",
                    "Ensures efficient transactions under Indonesian law."
                ]
            case .page10:
                [
                    "A platform for buying and selling securities.",
                    "clearing stock exchange settlements",
                    "Ensures efficient transactions under Indonesian law."
                ]
        }
    }
    
    var answers: String {
        switch self {
            case .page02:
                "An ownership instrument in a company"
            case .page04:
                "Stocks provide ownership of  company, while bonds represent a loan to issuer"
            case .page06:
                "They facilitate the acquisition of funds for company expansion and innovation."
            case .page08:
                "clearing stock exchange settlements"
            case .page09:
                "A platform for buying and selling securities."
            case .page10:
                "Ensures efficient transactions under Indonesian law."
        }
    }
    
    var image: Image? {
        switch self {
            case .page08:
                Image("kpei-logo")
            case .page09:
                Image("IDX-logo")
            case .page10:
                Image("ksei-logo")
            case .page02, .page04, .page06:
                nil
        }
    }
}
