//
//  HanvestSimulationNewsScreenView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 17/10/24.
//

import SwiftUI

struct HanvestSimulationNewsScreenView: View {
    let router: any AppRouterProtocol
    @StateObject private var viewmodel = LocalNewsSimulationViewModel()
    
    var body: some View {
        VStack {
            HanvestNavigationBar(
                label: "Notification",
                leadingIcon: Image(systemName: "chevron.left"),
                leadingAction: {
                    router.pop()
                }
            )
            
            VStack {
                if viewmodel.newsList.count != 0 {
                    ScrollView {
                        VStack(spacing: 24) {
                            ForEach(viewmodel.newsList, id: \.newsID) { news in
                                HanvestNewsButton(
                                    news: news,
                                    action: {
                                        router.push(.newsDetails(news: news))
                                    }
                                )
                            }
                        }
                    }
                }
                else {
                    Text("No News Available")
                }
            }
            .safeAreaPadding(.vertical, 32)
            .padding(.horizontal, 20)
        }
        .onAppear(){
            viewmodel.setup()
        }
    }
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .main
    
    NavigationStack(path: $appRouter.path) {
        if let startScreen = startScreen {
            appRouter.build(startScreen)
                .navigationDestination(for: Screen.self) { screen in
                    appRouter.build(screen)
                }
                .overlay {
                    if let popup = appRouter.popup {
                        ZStack {
                            appRouter.build(popup)
                        }
                       
                    }
                }
        }
    }
}
