//
//  SectorModuleViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 14/11/24.
//

import SwiftUI

class SectorModuleViewModel: ReusableContentViewModels {
    static func getContent() -> [any HanvestModuleContent] {
        return [
            ReusableModuleInformationEntity(
                id: "sector-1",
                title: "What's a Stock Sector",
                imageNames: [
                    "12-stock-sector-image"
                ],
                content: """
                    The Indonesia Stock Exchange (IDX) offers a sector-based classification system, which organizes companies into industry sectors to facilitate investment analysis. These sectors include financials, consumer goods, infrastructure, energy, healthcare, and more, each further divided into subsectors. The system allows investors to analyze trends within specific sectors and compare companies against their industry peers


                    Each sector has its own index that tracks the performance of companies within that sector, providing insight into sector-specific trends. For instance, the financial sector index may respond differently to economic events compared to the consumer goods index, allowing for targeted sector investments. Platforms like TradingView and Indonesia Investments provide real-time data and sectoral performance analysis to support investors in making informed decisions on the IDX.
                """
            ),
            ReusableModuleEvaluationEntity(
                id: "sector-2",
                question: "Which sector on the Indonesia Stock Exchange (IDX) includes banks and insurance firms, often sensitive to interest rate changes?",
                choices: [
                    "Consumer Goods",
                    "Financials",
                    "Infrastructure",
                    "Technology"
                ],
                correctAnswerIdx: 2
            ),
            ReusableModuleInformationEntity(
                id: "sector-3",
                title: "Explanation",
                imageNames: [
                    "12-stock-sector-image"
                ],
                content: """
                    The Financials sector on the IDX includes companies like banks and insurance firms. This sector is particularly sensitive to interest rate changes and broader economic conditions. For instance, when interest rates rise, it can impact loan demand and profitability for banks, while lower rates might encourage more borrowing and spending
                """
            ),
            ReusableModuleEvaluationEntity(
                id: "sector-4",
                question: "What sector is most likely to be influenced by consumer demand and economic stability, encompassing products like food and beverages?",
                choices: [
                    "Consumer Goods",
                    "Financials",
                    "Infrastructure",
                    "Technology"
                ],
                correctAnswerIdx: 1
            ),
            ReusableModuleInformationEntity(
                id: "sector-5",
                title: "Explanation",
                imageNames: [
                    "12-stock-sector-image"
                ],
                content: """
                    The Consumer Goods sector is influenced heavily by consumer spending and economic stability. This sector includes companies that produce everyday items such as food, beverages, and personal care products, which tend to see steady demand. However, during economic downturns, consumers may reduce spending, impacting this sector’s performance​
                """
            ),
            ReusableModuleEvaluationEntity(
                id: "sector-6",
                question: "Which of the following is a primary factor affecting the performance of the Infrastructure sector on the IDX?",
                choices: [
                    "Technology Advancements",
                    "Interest rates",
                    "Oil prices",
                    "Government spending and urbanization"
                ],
                correctAnswerIdx: 4
            ),
            ReusableModuleInformationEntity(
                id: "sector-7",
                title: "Explanation",
                imageNames: [
                    "12-stock-sector-image"
                ],
                content: """
                    The Infrastructure sector on the IDX, which includes utilities and construction companies, is largely driven by government investments in public works and urbanization projects. This spending can fuel demand for infrastructure and utilities, leading to growth in this sector. Economic policies and urban expansion directly impact the performance of these stocks​
                """
            ),
            ReusableModuleEvaluationEntity(
                id: "sector-8",
                question: "What is one benefit of the IDX sector-based classification system for investors?",
                choices: [
                    "It limits trading hours based on sector",
                    "It reduces volatility across the entire stock markets",
                    "It provides a detailed breakdown of companies’ financials",
                    "It allows investors to analyze trends and make comparisons"
                ],
                correctAnswerIdx: 4
            ),
            ReusableModuleInformationEntity(
                id: "sector-9",
                title: "Explanation",
                imageNames: [
                    "12-stock-sector-image"
                ],
                content: """
                    The IDX sector-based classification helps investors by grouping companies with similar business activities. This allows for targeted analysis and performance comparisons, enabling investors to make more informed decisions about which sectors or individual stocks to invest in, based on specific economic trends or forecasts
                """
            ),
            ReusableModuleEvaluationEntity(
                id: "sector-10",
                question: "What is one benefit of the IDX sector-based classification system for investors?",
                choices: [
                    "Energy",
                    "Consumer Goods",
                    "Technology",
                    "Financials"
                ],
                correctAnswerIdx: 3
            ),
            ReusableModuleInformationEntity(
                id: "sector-11",
                title: "Explanation",
                imageNames: [
                    "12-stock-sector-image"
                ],
                content: """
                    The Technology sector on the IDX has experienced rapid growth due to digital transformation, which has led to increased demand for tech services and innovation. This sector includes software, hardware, and digital service companies, which are highly responsive to technological advancements and shifts in consumer behavior toward online and digital solutions
                """
            ),
        ]
    }
}

