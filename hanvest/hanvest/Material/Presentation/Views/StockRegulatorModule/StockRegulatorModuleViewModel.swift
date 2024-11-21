//
//  Module04ViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 19/10/24.
//

import SwiftUI

class StockRegulatorModuleViewModel: ReusableContentViewModels {
    static func getContent() -> [any HanvestModuleContent] {
        return [
            ReusableModuleInformationEntity(
                id: "stock-regulator-1",
                title: "What are stocks, stock invest, and capital market?",
                imageNames: [
                    "stock-chart-cartoon"
                ],
                content: """
                    Stocks represent a portion of ownership in a company. When you buy them, you own a small part of the business and may earn dividends or profit if the stock's price increases. Investing in stocks means buying shares with the expectation that their value will rise. The capital market is where these stocks and other financial assets are traded, allowing companies to raise money for growth while giving investors the opportunity to earn returns.
                
                    Reference: Graham, B., & Zweig, J. (2006)
                """
            ),
            ReusableModuleEvaluationEntity(
                id: "stock-regulator-2",
                question: "What is a stock?",
                choices: [
                    "An ownership instrument in a company",
                    "A type of debt issued by companies",
                    "A government-issued security",
                    "Professional pooled investment"
                ],
                correctAnswerIdx: 1
            ),
            ReusableModuleInformationEntity(
                id: "stock-regulator-3",
                title: "Explanation about stocks",
                imageNames: [
                    "stock-chart-cartoon"
                ],
                content: """
                    Stocks represent ownership in a company. When someone purchases stock, they acquire a small percentage of the company, entitling them to dividends and the potential appreciation of the stock's value. Options A and B refer to bonds, while option D describes mutual funds, not stocks.
                """
            ),
            ReusableModuleEvaluationEntity(
                id: "stock-regulator-4",
                question: "Which of the following is true about stocks and bonds?",
                choices: [
                    "Stocks provide ownership of  company, while bonds represent a loan to issuer",
                    "Stocks have fixed returns, while bonds are subject to market fluctuations"
                ],
                correctAnswerIdx: 1
            ),
            ReusableModuleInformationEntity(
                id: "stock-regulator-5",
                title: "Explanation about market that allow company to sell equity",
                imageNames: [
                    "investment-plan-cartoon"
                ],
                content: """
                    Mutual funds pool money from many investors to purchase a diversified portfolio of assets, including stocks and bonds. This allows investors to access a broader range of investments than they could individually.
                """
            ),
            ReusableModuleEvaluationEntity(
                id: "stock-regulator-6",
                question: "Which of the following is true about stock market?",
                choices: [
                    "They facilitate the acquisition of funds for company expansion and innovation",
                    "They provide guaranteed returns for all investments"
                ],
                correctAnswerIdx: 1
            ),
            ReusableModuleInformationEntity(
                id: "stock-regulator-7",
                title: "Explanation about role of capital market in the economy",
                imageNames: [
                    "money-trades-cartoon"
                ],
                content: """
                    Capital markets enable companies to raise funds by issuing stocks and bonds, which allows for growth, expansion, and innovation. This process benefits the economy by increasing productivity and creating jobs.
                """
            ),
            ReusableModuleEvaluationEntity(
                id: "stock-regulator-8",
                question: "What is the function of these organizations?",
                imageName: "kpei-logo",
                choices: [
                    "A platform for buying and selling securities",
                    "clearing stock exchange settlements",
                    "Ensures efficient transactions under Indonesian law"
                ],
                correctAnswerIdx: 2
            ),
            ReusableModuleEvaluationEntity(
                id: "stock-regulator-9",
                question: "What is the function of these organizations?",
                imageName: "IDX-logo",
                choices: [
                    "A platform for buying and selling securities",
                    "clearing stock exchange settlements",
                    "Ensures efficient transactions under Indonesian law"
                ],
                correctAnswerIdx: 1
            ),
            ReusableModuleEvaluationEntity(
                id: "stock-regulator-10",
                question: "What is the function of these organizations?",
                imageName: "ksei-logo",
                choices: [
                    "A platform for buying and selling securities",
                    "clearing stock exchange settlements",
                    "Ensures efficient transactions under Indonesian law"
                ],
                correctAnswerIdx: 3
            ),
            ReusableModuleInformationEntity(
                id: "stock-regulator-11",
                title: "Measuring the Economic Cycle",
                imageNames: [
                    "kpei-logo",
                    "IDX-logo",
                    "ksei-logo"
                ],
                content: """
                    In Indonesia's capital market, Self-Regulatory Organizations (SROs) have the authority to create rules for their members. There are three key SROs:
                """,
                pointContent: ReusableModulePointEntity(
                    pointList: [
                        "Indonesia Stock Exchange (IDX): IDX provides a platform for buying and selling stocks, ensuring trades are orderly and efficient. It is operated by PT Bursa Efek Indonesia.",
                        "Indonesian Clearing and Guarantee Corporation (KPEI): KPEI clears and guarantees stock transactions, defining members' rights and obligations after a trade. It is managed by PT Kliring dan Penjaminan Efek Indonesia.",
                        "Indonesian Central Securities Depository (KSEI): KSEI oversees the custody and settlement of securities, ensuring smooth and efficient transactions. This is handled by PT Kustodian Sentral Efek Indonesia, in line with Indonesia’s Capital Market Law."
                    ],
                    isBulleted: false
                )
            )
        ]
    }
}
