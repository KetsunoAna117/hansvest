//
//  MacroEconomicsModuleViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 14/11/24.
//

import SwiftUI

class MacroEconomicsModuleViewModel: ReusableContentViewModels {
    static func getContent() -> [any HanvestModuleContent] {
        return [
            ReusableModuleInformationEntity(
                id: "macro-economics-1",
                title: "MacroEconomics",
                imageNames: [
                    "gdp-vs-time"
                ],
                content: "The economic cycle has four key stages:",
                pointContent: ReusableModulePointEntity(
                    pointList: [
                        "Expansion: The economy grows with increasing production and demand, usually driven by consumer confidence, low interest rates, and strong investment. Employment rises, and company profits increase.",
                        "Peak: The highest point in the cycle, where growth reaches its maximum before a decline begins. At this stage, the economy may show signs of slowing down, such as high inflation.",
                        "Contraction or Recession: The economy declines. Production decreases, unemployment rises, and consumption slows. This can lead to a recession or even a depression if it continues for an extended period."
                    ],
                    isBulleted: true
                )
            ),
            ReusableModuleEvaluationEntity(
                id: "macro-economics-2",
                question: "What Investors Can Do in Each Phase of the Economic Cycle During expansion phase?",
                choices: [
                    "Diversify the portfolio or consider more stable assets like bonds",
                    "Focus on stocks and risky assets due to high growth potential",
                    "Switch to defensive assets, such as government bonds or gold",
                    "Start taking greater risks by buying stocks, as growth potential is high at the start of an expansion"
                ],
                correctAnswerIdx: 2
            ),
            ReusableModuleInformationEntity(
                id: "macro-economics-3",
                title: "Strategic Investing Across Economic Cycles: What to Do in Each Phase",
                imageNames: [
                    "gdp-vs-time"
                ],
                content: "Here’s how investors can strategically navigate each phase of the economic cycle:",
                pointContent:
                    ReusableModulePointEntity(
                        pointList: [
                            "Expansion: Focus on stocks and risky assets due to high growth potential.",
                            "Peak: Diversify the portfolio or consider more stable assets like bonds.",
                            "Recession: Switch to defensive assets, such as government bonds or gold.",
                            "Trough: Start taking greater risks by buying stocks, as growth potential is high at the start of an expansion."
                        ],
                        isBulleted: true
                    )
            ),
            ReusableModuleEvaluationEntity(
                id: "macro-economics-4",
                question: "Whats is not the factor of measuring the economic cycle?",
                choices: [
                    "GDP",
                    "Geographical Conditions",
                    "Inflation",
                    "Interest Rate"
                ],
                correctAnswerIdx: 2
            ),
            ReusableModuleInformationEntity(
                id: "macro-economics-5",
                title: "Measuring the Economic Cycle",
                content: "The economic cycle is measured by monitoring various key economic indicators, such as:",
                pointContent: ReusableModulePointEntity(
                    pointList: [
                        "Gross Domestic Product (GDP): Measures the total economic output, rising during expansion and falling during contraction.",
                        "Unemployment Rate: Typically low at the peak and increases during a recession.",
                        "Inflation: Rises at the end of an expansion and stabilizes or falls during a recession.",
                        "Interest Rates: Usually low to stimulate expansion or high to control inflation."
                    ],
                    isBulleted: true
                )
            )
        ]
    }
}
