//
//  HanvestSimulationNewsScreenView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 17/10/24.
//

import SwiftUI

struct HanvestSimulationNewsScreenView: View {
    let router: any AppRouterProtocol
    @ObservedObject var userDataViewModel: HanvestLoadedUserDataViewModel
    
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
                if let user = userDataViewModel.userData {
                    if user.notificationList.count != 0 {
                        ScrollView {
                            VStack(spacing: 24) {
                                ForEach(user.notificationList, id: \.notificationID) { notification in
                                    HanvestNewsButton(
                                        notification: notification,
                                        action: {
                                            router.push(.newsDetails(notification: notification))
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
                    Text("No user detected, please login")
                }
            }
            .safeAreaPadding(.vertical, 32)
            .padding(.horizontal, 20)
            .frame(maxHeight: .infinity)
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
