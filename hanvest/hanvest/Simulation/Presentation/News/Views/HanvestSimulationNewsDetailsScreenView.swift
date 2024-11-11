//
//  HanvestSimulationNewsDetailsScreenView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 18/10/24.
//

import SwiftUI

struct HanvestSimulationNewsDetailsScreenView: View {
    let router: any AppRouterProtocol
    
    let notification: UserNotificationEntity
    
    var body: some View {
        VStack {
            HanvestNavigationBar(
                label: notification.stockNews.stockIDName,
                leadingIcon: Image(systemName: "chevron.left"),
                leadingAction: {
                    router.pop()
                }
            )
            
            ScrollView {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text(notification.stockNews.newsTitle)
                            .font(.nunito(.title3, .bold))
                        Text(HanvestDateFormatter.getTimeDifferenceFrom(notification.releasedTime))
                            .font(.nunito(.footnote))
                            .foregroundStyle(Color.secondary)
                    }
                    
                    Text(notification.stockNews.newsContent)
                        .font(.nunito(.body))
                        .foregroundStyle(.primary)
                        .padding(.top, 16)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .safeAreaPadding(.vertical, 32)
            }
        }
    }
}

//#Preview {
//    @Previewable @StateObject var appRouter = AppRouter()
//    @Previewable @State var startScreen: Screen? = .newsDetails(news: StockNewsEntity.mock().first!)
//    
//    NavigationStack(path: $appRouter.path) {
//        if let startScreen = startScreen {
//            appRouter.build(startScreen)
//                .navigationDestination(for: Screen.self) { screen in
//                    appRouter.build(screen)
//                }
//                .overlay {
//                    if let popup = appRouter.popup {
//                        ZStack {
//                            appRouter.build(popup)
//                        }
//                       
//                    }
//                }
//        }
//    }
//}
