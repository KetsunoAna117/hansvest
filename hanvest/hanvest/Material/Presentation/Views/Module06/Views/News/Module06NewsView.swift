//
//  HanvestSimulationNewsScreenView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 17/10/24.
//

import SwiftUI

struct Module06NewsView: View {
    let moduleRouter: any Module06RouterProtocol
    
    @ObservedObject var profileViewModel: Module06ProfileViewModel
    @ObservedObject var simulationViewModel: Module06SimulationViewModel
    @ObservedObject var newsViewModel: Module06NewsViewModel
    
    var body: some View {
        VStack {
            HanvestNavigationBar(
                label: "Notification",
                leadingIcon: Image(systemName: "chevron.left"),
                leadingAction: {
                    moduleRouter.pop()
                }
            )
            
            VStack {
                if newsViewModel.newsList.count != 0 {
                    ScrollView {
                        VStack(spacing: 24) {
                            ForEach(newsViewModel.newsList, id: \.newsID) { news in
                                HanvestNewsButton(
                                    news: news,
                                    action: {
                                        moduleRouter.push(
                                            .newsDetail(news: news)
                                        )
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
