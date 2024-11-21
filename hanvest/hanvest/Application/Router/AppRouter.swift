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
    @Published var notificationPermission: Bool = true
    
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
        if self.notificationPermission == true {
            withAnimation(.linear(duration: 0.5)) {
                self.notification = notification
            }
        }
    }
    
    func dismissNotification(){
        withAnimation(.linear(duration: 0.5)) {
            self.notification = nil
        }
    }
    
    func setNotificationPermission(_ permission: Bool) {
        if permission == false {
            dismissNotification()
        }
        self.notificationPermission = permission
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
            .onAppear(){
                self.setNotificationPermission(false)
            }
            
        case .main:
            ZStack {
                Color.background.ignoresSafeArea()
                MainScreenView(router: self)
            }
            .navigationBarBackButtonHidden()
            .onAppear(){
                self.setNotificationPermission(true)
            }
            
        case .materialBasicInvestmentModule:
            ZStack {
                Color.background.ignoresSafeArea()
                MaterialBasicInvestmentModuleScreenView(router: self)
            }
            .navigationBarBackButtonHidden()
            .onAppear(){
                self.setNotificationPermission(false)
            }
            
        case .materialLiabilitiesVsAsset:
            ZStack {
                Color.background.ignoresSafeArea()
                MaterialLiabilitiesVsAssetModuleScreenView(router: self)
            }
            .navigationBarBackButtonHidden()
            .onAppear(){
                self.setNotificationPermission(false)
            }
            
        case .materialRiskAndReturnModule:
            ZStack {
                Color.background.ignoresSafeArea()
                MaterialRiskAndReturnScreenView(router: self)
            }
            .navigationBarBackButtonHidden()
            .onAppear(){
                self.setNotificationPermission(false)
            }
            
        case .materialFundamentalModule:
            ZStack {
                Color.background.ignoresSafeArea()
                MaterialFundamentalModuleScreenView(appRouter: self)
            }
            .navigationBarBackButtonHidden()
            .onAppear(){
                self.setNotificationPermission(false)
            }
            
        case .materialNewsModule:
            ZStack {
                Color.background.ignoresSafeArea()
                MaterialNewsModuleScreenView(appRouter: self)
            }
            .navigationBarBackButtonHidden()
            .onAppear(){
                self.setNotificationPermission(false)
            }
            
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
            
        case .reusableMaterialModule(let materialViewModel):
            ZStack {
                Color.background.ignoresSafeArea()
                ReusableModuleMainScreenView(
                    appRouter: self,
                    viewModel: materialViewModel
                )
            }
            .navigationBarBackButtonHidden()
            .onAppear {
                self.setNotificationPermission(false)
            }
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
                DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                    self.dismissNotification()
                })
            }
        }
    }
    
    
    
}
