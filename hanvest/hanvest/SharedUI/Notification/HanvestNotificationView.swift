//
//  HanvestNotificationView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 28/10/24.
//

import SwiftUI

struct HanvestNotificationView: View {
    let appRouter: any AppRouterProtocol
    let notification: UserNotificationEntity
    
    var body: some View {
        HStack() {
            HStack {
                Image(.onboardingHanvestAppLogo)
                    .resizable()
                    .frame(width: 32, height: 32)
                VStack(alignment: .leading) {
                    Text("Hanvest News!")
                        .font(.nunito(.subhead, .bold))
                    Text(notification.stockNews.newsTitle)
                        .font(.nunito(.subhead))
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 16)
        }
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal, 12)
        .onTapGesture {
            appRouter.dismissNotification()
            appRouter.push(.newsDetails(notification: notification))
        }
    }
}

//#Preview {
//    HanvestNotificationView(
//        notification:
//            .init(
//                newsID: UUID().uuidString,
//                stockIDName: "GOTO",
//                newsTitle: "GOTO gets billions in funding",
//                newsReleasedTime: Date(timeInterval: -10, since: Date.now),
//                newsContent:
//                """
//                In a recent report released today, Chinese tech giant Alibaba is said to have injected billions of rupiah into Gojek Tokopedia (GOTO). This investment is seen as part of Alibaba’s strategy to expand its business reach in Southeast Asia, particularly in Indonesia.
//                
//                Alibaba's move is viewed as an effort to strengthen GOTO’s ecosystem, which spans e-commerce, on-demand services, including transportation, food delivery, and online shopping platforms that are increasingly dominating the domestic market.
//                
//                The Chinese company is no stranger to Southeast Asia, having previously made significant investments in Lazada. With this new capital infusion, GOTO is expected to accelerate its growth and better compete against other global tech giants.
//                
//                Neither GOTO nor Alibaba has provided an official comment on the report, but analysts predict that this investment will further solidify GOTO’s position as a key player in Indonesia’s digital economy.
//                
//                """,
//                stockFluksPercentage: 10,
//                hasTriggered: true
//            )
//    )
//}
