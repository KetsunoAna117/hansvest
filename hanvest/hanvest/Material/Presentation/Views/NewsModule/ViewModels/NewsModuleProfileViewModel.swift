//
//  Module06ProfileViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 27/10/24.
//

import Foundation

class NewsModuleProfileViewModel: ObservableObject {
    var userData: UserDataEntity?
    
    func setup(){
        self.userData = UserDataEntity(
            userId: "user-module-simulation",
            userName: "user-module-simulation",
            userBalance: 1000000,
            userRiskProfile: .conservative,
            userInvestmentTransaction: [
                .init(
                    investmentID: "investment-01",
                    stockIDName: "GOTE",
                    totalInvested: 9 * 1000 * 100,
                    lotPurchased: 9,
                    stockTransaction: [
                        .init(
                            transactionID: "transaction-gomm-01",
                            stockIDName: "GOTE",
                            priceAtPurchase: 1000,
                            stockLotQuantity: 9,
                            time: Date.now
                        )
                    ]
                )
            ],
            transactionQueue: [],
            moduleCompletionList: [],
            notificationList: [
                .init(
                    notificationID: "notification-01",
                    releasedTime: Date.now,
                    hasTriggered: false,
                    stockNews: .init(
                        newsID: "news-id-01",
                        stockIDName: "GOTE",
                        newsTitle: "GOTE gets billions in funding",
                        newsContent:
                        """
                        In a recent report released today, Chinese tech giant Alibaba is said to have injected billions of rupiah into PT. Ganas Ojek Teladan (GOTE). This investment is seen as part of Alibaba’s strategy to expand its business reach in Southeast Asia, particularly in Indonesia.
                        
                        Alibaba's move is viewed as an effort to strengthen GOTE’s ecosystem, which spans e-commerce, on-demand services, including transportation, food delivery, and online shopping platforms that are increasingly dominating the domestic market.
                        
                        The Chinese company is no stranger to Southeast Asia, having previously made significant investments in Lazaday. With this new capital infusion, GOTE is expected to accelerate its growth and better compete against other global tech giants.
                        
                        Neither GOTE nor Alibaba has provided an official comment on the report, but analysts predict that this investment will further solidify GOTE’s position as a key player in Indonesia’s digital economy.
                        """,
                        stockFluksPercentage: 10
                    )
                )
            ]
        )
    }
    
    func addUserInvestmentTransaction(transaction: StockInvestmentEntity){
        if userData != nil {
            if let index = userData?.userInvestmentTransaction.firstIndex(where: { $0.stockIDName == transaction.stockIDName }) {
                userData?.userInvestmentTransaction[index].totalInvested += transaction.totalInvested
                userData?.userInvestmentTransaction[index].lotPurchased += transaction.lotPurchased
            }
            else {
                userData?.userInvestmentTransaction.append(transaction)
            }
            
            userData?.userBalance -= transaction.totalInvested
        }
    }
}
