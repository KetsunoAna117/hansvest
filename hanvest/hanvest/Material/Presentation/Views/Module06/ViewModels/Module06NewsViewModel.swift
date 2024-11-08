//
//  Module06NewsViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 27/10/24.
//

import Foundation

class Module06NewsViewModel: HanvestNewsSimulationViewModel{
    
    override func setup() {
        self.newsList.append(
            .init(
                newsID: "news-id-01",
                stockIDName: "GOTE",
                newsTitle: "GOTE gets billions in funding",
                newsReleasedTime: Date.now,
                newsContent:
                """
                In a recent report released today, Chinese tech giant Alibaba is said to have injected billions of rupiah into PT. Ganas Ojek Teladan (GOTE). This investment is seen as part of Alibaba’s strategy to expand its business reach in Southeast Asia, particularly in Indonesia.
                
                Alibaba's move is viewed as an effort to strengthen GOTE’s ecosystem, which spans e-commerce, on-demand services, including transportation, food delivery, and online shopping platforms that are increasingly dominating the domestic market.
                
                The Chinese company is no stranger to Southeast Asia, having previously made significant investments in Lazaday. With this new capital infusion, GOTE is expected to accelerate its growth and better compete against other global tech giants.
                
                Neither GOTE nor Alibaba has provided an official comment on the report, but analysts predict that this investment will further solidify GOTE’s position as a key player in Indonesia’s digital economy.
                """,
                stockFluksPercentage: 10,
                hasTriggered: false
            )
        )
    }
}
