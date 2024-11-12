//
//  Module03MaterialInformation.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

enum RiskAndReturnModuleMaterialInformationPageContent: Int, CaseIterable {
    case page05 = 4
    case page06 = 5
    
    var title: String {
        switch self {
            case .page05, .page06:
                "What is the relationship between risk and return in investment?"
        }
    }
    
    var detailText: Text {
        switch self {
            case .page05:
                Text("This analogy shows how each investment carries different levels of risk and return, helping to explain their behavior and potential outcomes.\n\n").font(.nunito(.callout)) +
                Text("Reference").font(.nunito(.callout, .bold)) +
                Text(": Ross, S. A., Westerfield, R. W., & Jaffe, J. (2013). Corporate Finance. McGraw-Hill Education.").font(.nunito(.callout))
            case .page06:
                Text("This analogy shows how each investment carries different levels of risk and return.\n\n").font(.nunito(.callout)) +
                Text("Reference").font(.nunito(.callout, .bold)) +
                Text(": Ross, S. A., Westerfield, R. W., & Jaffe, J. (2013). Corporate Finance. McGraw-Hill Education.").font(.nunito(.callout))
        }
    }
    
    var bulletPoints: [String] {
        switch self {
            case .page05:
                [
                    "Deposits (Savings or Time Deposits): These are considered stable investments. Your principal is safe, and the return is steady but modest, much like a stable but low-interest savings account.",
                    "Bonds: Bonds have a moderate level of fluctuation. They can rise and fall in value, but the changes are generally smaller compared to stocks. The risk is low to moderate, and so is the return, but it's still more dynamic than a savings account.",
                    "Stocks: Stocks are the most volatile, with large price swings both up and down. The potential for high returns is significant, but there's also a greater chance of loss, making them the most fluid and unpredictable of the three."
                ]
            case .page06:
                [
                    "Deposits: The return is steady but modest, much like a stable but low-interest savings account.",
                    "Bonds: Bonds have a moderate level of fluctuation. They can rise and fall in value, but the changes are generally smaller compared to stocks.",
                    "Stocks: Stocks are the most volatile, The potential for high returns and loss is significant, so stock are more unpredictable of the three."
                ]
        }
    }
}
