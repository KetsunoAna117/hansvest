//
//  HanvestSimulationNewsScreenView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 17/10/24.
//

import SwiftUI

struct NewsModuleView: View {
    let appRouter: any AppRouterProtocol
    let moduleRouter: any NewsModuleRouterProtocol
    
    @ObservedObject var profileViewModel: NewsModuleProfileViewModel
    @ObservedObject var simulationViewModel: NewsModuleSimulationViewModel
    
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
                if let userData = profileViewModel.userData {
                    if userData.notificationList.count != 0 {
                        ScrollView {
                            VStack(spacing: 24) {
                                ForEach(userData.notificationList, id: \.notificationID) { notification in
                                    HanvestNewsButton(
                                        notification: notification,
                                        action: {
                                            moduleRouter.push(
                                                .newsDetail(
                                                    appRouter: appRouter,
                                                    notification: notification,
                                                    simulationViewModel: simulationViewModel
                                                )
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
                else {
                    Text("No User Data Available")
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
