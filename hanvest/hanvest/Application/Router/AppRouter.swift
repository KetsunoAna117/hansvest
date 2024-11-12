//
//  AppRouter.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 15/10/24.
//

import SwiftUI

class AppRouter: AppRouterProtocol, ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    @Published var popup: Popup?
    @Published var notification: HanvestNotification?
    @Published var startScreen: Screen?
    
    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func presentOverlay(_ popup: Popup) {
        withAnimation(.easeInOut(duration: 0.2)) {
            self.popup = popup
        }
    }
    
    func dismissPopup() {
        withAnimation(.easeInOut(duration: 0.2)) {
            self.popup = nil
        }
    }
    
    func presentNotification(_ notification: HanvestNotification) {
        withAnimation(.linear(duration: 0.5)) {
            self.notification = notification
        }
    }
    
    func dismissNotification(){
        withAnimation(.linear(duration: 0.5)) {
            self.notification = nil
        }
    }
    
    // MARK: - Presentation Style Providers
    @ViewBuilder
    func build(_ screen: Screen) -> some View {
        switch screen {
        case .debug:
            ZStack {
                Color.background.ignoresSafeArea()
                DebugView(router: self)
            }
            .navigationBarBackButtonHidden()
            
        case .onboarding:
            ZStack {
                Color.background.ignoresSafeArea()
                RiskProfileView(router: self)
            }
            .navigationBarBackButtonHidden()
            
        case .main:
            ZStack {
                Color.background.ignoresSafeArea()
                MainScreenView(router: self)
            }
            .navigationBarBackButtonHidden()
            
        case .materialModule01:
            ZStack {
                Color.background.ignoresSafeArea()
                Module01View(router: self)
            }
            .navigationBarBackButtonHidden()
            
        case .materialModule02:
            ZStack {
                Color.background.ignoresSafeArea()
                Module02View(router: self)
            }
            .navigationBarBackButtonHidden()
            
        case .materialModule03:
            ZStack {
                Color.background.ignoresSafeArea()
                Module03View(router: self)
            }
            .navigationBarBackButtonHidden()
            
        case .materialModule04:
            ZStack {
                Color.background.ignoresSafeArea()
                Module04View(router: self)
            }
            .navigationBarBackButtonHidden()
            
        case .materialModule05:
            ZStack {
                Color.background.ignoresSafeArea()
                MaterialFundamentalModuleScreenView(appRouter: self)
            }
            .navigationBarBackButtonHidden()
            
        case .materialModule06:
            ZStack {
                Color.background.ignoresSafeArea()
                MaterialModule06ScreenView(appRouter: self)
            }
            .navigationBarBackButtonHidden()
            
        case .simulationBuyingConfirmation(let simulationViewModel, let userData):
            ZStack {
                Color.background.ignoresSafeArea()
                HanvestBuyStockScreenView(
                    router: self,
                    userData: userData,
                    simulationViewModel: simulationViewModel
                )
            }
            .navigationBarBackButtonHidden()
            
        case .simulationSellingConfirmation(let simulationViewModel, let userData):
            ZStack {
                Color.background.ignoresSafeArea()
                HanvestSellStockScreenView(
                    router: self,
                    userData: userData,
                    simulationViewModel: simulationViewModel
                )
            }
            .navigationBarBackButtonHidden()
            
        case .news(let userViewModel):
            ZStack {
                Color.background.ignoresSafeArea()
                HanvestSimulationNewsScreenView(
                    router: self,
                    userDataViewModel: userViewModel
                )
            }
            .navigationBarBackButtonHidden()
            
        case .glossary:
            ZStack {
                Color.background.ignoresSafeArea()
                GlossaryView(router: self)
            }
            .navigationBarBackButtonHidden()
            
        case .profile:
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    Text("Not yet Implemented!")
                    HanvestButtonDefault(size: .medium, title: "Go Back", action: {
                        self.pop()
                    })
                }
            }
            .navigationBarBackButtonHidden()
            
        case .newsDetails(let notification):
            ZStack {
                Color.background.ignoresSafeArea()
                HanvestSimulationNewsDetailsScreenView(
                    router: self,
                    notification: notification
                )
            }
            .navigationBarBackButtonHidden()
            
        case .transactionStatus(let transaction):
            ZStack {
                Color.background.ignoresSafeArea()
                TransactionStatusView(router: self, transaction: transaction)
            }
            .navigationBarBackButtonHidden()
            
        case .moduleCompletion(let completionItem):
            ZStack {
                Color.background.ignoresSafeArea()
                CompletionPageView(router: self, completionItem: completionItem)
            }
            .navigationBarBackButtonHidden()
            
        case .searchGlossary(let glossaryViewModel):
            ZStack {
                Color.background.ignoresSafeArea()
                SearchView(router: self, glossaryViewModel: glossaryViewModel)
            }
            .navigationBarBackButtonHidden()
        }
    }
    
    @ViewBuilder
    func build(_ popup: Popup) -> some View {
        switch popup {
        case .withHanvestPopupButton(let title, let desc, let buttonAction):
            ZStack {
                Color.black.opacity(0.7).ignoresSafeArea()
                    .onTapGesture {
                        self.dismissPopup()
                    }
                
                VStack(spacing: 8) {
                    Text("Tap anywhere to cancel")
                        .font(.nunito(.subhead))
                        .foregroundStyle(.mineShaft50)
                    HanvestPopup(
                        title: title,
                        description: desc,
                        action: {
                            buttonAction()
                            self.dismissPopup()
                        }
                    )
                }
                .padding(.horizontal, HanvestConstant.overlayHorizontalPaddingMain)
            }
            
        case .withHanvestPopup(let title, let desc, let dismissAction):
            ZStack {
                Color.black.opacity(0.7).ignoresSafeArea().onTapGesture {
                    dismissAction()
                    self.dismissPopup()
                }
                VStack(spacing: 8) {
                    HanvestPopup(title: title, description: desc)
                        .padding(.horizontal, 20)
                    Text("Tap anywhere to continue")
                        .font(.nunito(.subhead))
                        .foregroundStyle(.mineShaft50)
                }
            }
            
        case .withBuyConfirmationPopup(let viewmodel, let confirmAction, let cancelAction):
            ZStack {
                Color.black.opacity(0.7).ignoresSafeArea()
                
                SimulationBuyingConfirmationCard(
                    viewModel: viewmodel,
                    cancelAction: {
                        cancelAction()
                        self.dismissPopup()
                    },
                    confirmAction: {
                        confirmAction()
                        self.dismissPopup()
                    }
                )
                .padding(.horizontal, HanvestConstant.overlayHorizontalPaddingSimulation)
            }
            
        case .withSellConfirmationPopup(let viewmodel, let confirmAction, let cancelAction):
            ZStack {
                Color.black.opacity(0.7).ignoresSafeArea()
                
                SimulationSellingConfirmationCard(
                    viewModel: viewmodel,
                    cancelAction: {
                        cancelAction()
                        self.dismissPopup()
                    },
                    confirmAction: {
                        confirmAction()
                        self.dismissPopup()
                    }
                )
                .padding(.horizontal, HanvestConstant.overlayHorizontalPaddingSimulation)
            }
            
        case .withGlossaryPopup(let title, let desc, let buttonAction):
            ZStack{
                Color.black.opacity(0.7).ignoresSafeArea()
                    .onTapGesture {
                        buttonAction()
                        self.dismissPopup()
                    }
                
                HanvestPopup(title: title, description: desc)
                    .padding(.horizontal, HanvestConstant.overlayHorizontalPaddingMain)
                
            }
        }
    }
    
    @ViewBuilder
    func build(_ notification: HanvestNotification) -> some View {
        switch notification {
        case .notification(let news):
            ZStack {
                HanvestNotificationView(
                    appRouter: self,
                    notification: news
                )
            }
            .gesture(
                DragGesture()
                    .onEnded { value in
                        // Detect upward swipe
                        if value.translation.height < -50 {
                            self.dismissNotification()
                        }
                    }
            )
            .frame(maxHeight: .infinity, alignment: .top)
            .onAppear(){
                DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                    self.dismissNotification()
                })
            }
        }
    }
    
    
    
}
