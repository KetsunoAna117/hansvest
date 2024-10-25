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
        self.popup = popup
    }
    
    func dismissPopup() {
        self.popup = nil
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
                VStack {
                    Text("Not yet Implemented!")
                    HanvestButtonDefault(size: .medium, title: "Go Back", action: {
                        self.pop()
                    })
                }
            }
            .navigationBarBackButtonHidden()
            
        case .main:
            ZStack {
                Color.background.ignoresSafeArea()
                MainScreenView(router: self)
                    .overlay {
                        if let popup = popup {
                            ZStack {
                                self.build(popup)
                            }
                            // Apply transition and animation
                            .transition(.opacity) // You can use other transitions like .scale, .move, etc.
                            .animation(.easeInOut(duration: 0.3), value: self.popup)
                        }
                    }
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
            
        case .simulationBuyingConfirmation(let simulationViewModel):
            ZStack {
                Color.background.ignoresSafeArea()
                HanvestBuyStockScreenView(router: self)
                    .environmentObject(simulationViewModel)
                    .overlay {
                        if let popup = popup {
                            ZStack {
                                self.build(popup)
                            }
                            // Apply transition and animation
                            .transition(.opacity) // You can use other transitions like .scale, .move, etc.
                            .animation(.easeInOut(duration: 0.3), value: self.popup)
                        }
                    }
            }
            .navigationBarBackButtonHidden()
            
        case .simulationSellingConfirmation(let simulationViewModel):
            ZStack {
                Color.background.ignoresSafeArea()
                HanvestSellStockScreenView(router: self)
                    .environmentObject(simulationViewModel)
                    .overlay {
                        if let popup = popup {
                            ZStack {
                                self.build(popup)
                            }
                            // Apply transition and animation
                            .transition(.opacity) // You can use other transitions like .scale, .move, etc.
                            .animation(.easeInOut(duration: 0.3), value: self.popup)
                        }
                    }
            }
            .navigationBarBackButtonHidden()
            
        case .news:
            ZStack {
                Color.background.ignoresSafeArea()
                HanvestSimulationNewsScreenView(router: self)
            }
            .navigationBarBackButtonHidden()
            
        case .glossary:
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
            
        case .newsDetails(news: let news):
            ZStack {
                Color.background.ignoresSafeArea()
                HanvestSimulationNewsDetailsScreenView(router: self, news: news)
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
        }
    }
    
    
    
}
