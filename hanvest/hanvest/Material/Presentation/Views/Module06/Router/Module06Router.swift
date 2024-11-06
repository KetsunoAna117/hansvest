//
//  Module06Router.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 27/10/24.
//

import SwiftUI

class Module06Router: Module06RouterProtocol, ObservableObject {
    @Published var content: [Module06ContentView] = []
    @Published var overlay: Module06Overlay?
    
    @Published var progress: Int = 0
    
    func push(_ content: Module06ContentView) {
        self.content.append(content)
    }
    
    func pop() {
        if self.content.count <= 1 {
            return
        }
        
        self.content.removeLast()
    }
    
    func popToRoot() {
        self.content.removeLast(content.count - 1)
    }
    
    func displayOverlay(_ overlay: Module06Overlay) {
        withAnimation(.easeInOut(duration: 0.2)) {
            self.overlay = overlay
        }
    }
    
    func dismissOverlay() {
        withAnimation(.easeInOut(duration: 0.2)) {
            self.overlay = nil
        }
    }
    
    func addProgress() {
        self.progress += 1
    }
    
    @ViewBuilder
    func build(_ content: Module06ContentView) -> some View {
        switch content {
        case .simulation(
            let appRouter,
            let profileViewModel,
            let simulationViewModel,
            let newsViewModel
        ):
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    Module06HeaderView(
                        userDataViewModel: profileViewModel,
                        bookIconTappedAction: {
                            // User can't use this button in this module, hence this will do nothing.
                        },
                        bellIconTappedAction: {
                            self.push(
                                .notification(
                                    appRouter: appRouter,
                                    profileViewModel: profileViewModel,
                                    simulationViewModel: simulationViewModel,
                                    notificationViewModel: newsViewModel
                                )
                            )
                        },
                        profileIconTappedAction: {
                            // User can't use this button in this module, hence this will do nothing.
                        }
                    )
                    Module06SimulationView(
                        appRouter: appRouter,
                        moduleRouter: self,
                        profileViewModel: profileViewModel,
                        simulationViewModel: simulationViewModel
                    )
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
            .navigationBarBackButtonHidden()
            
        case .confirmBuy(let appRouter, let profileViewModel, let simulationViewModel):
            ZStack {
                Color.background.ignoresSafeArea()
                Module06ConfirmationBuyView(
                    moduleRouter: self,
                    profileViewModel: profileViewModel,
                    simulationViewModel: simulationViewModel
                )
            }
            .navigationBarBackButtonHidden()
            .onAppear(){
                simulationViewModel.currentStage = .buyState(appRouter: appRouter)
            }
            
        case .confirmSell(let appRouter, let profileViewModel, let simulationViewModel):
            ZStack {
                Color.background.ignoresSafeArea()
                Module06ConfirmationSellView(
                    moduleRouter: self,
                    profileViewModel: profileViewModel,
                    simulationViewModel: simulationViewModel
                )
            }
            .navigationBarBackButtonHidden()
            .onAppear(){
                simulationViewModel.currentStage = .sellState(appRouter: appRouter)
            }
            
        case .transactionComplete(let profileViewModel, let simulationViewModel, let transactionViewModel):
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    Module06TransactionStatusView(
                        moduleRouter: self,
                        profileViewModel: profileViewModel,
                        simulationViewModel: simulationViewModel,
                        transaction: transactionViewModel
                    )
                }
            }
            .navigationBarBackButtonHidden()
            
        case .notification(let appRouter, let profileViewModel, let simulationViewModel, let newsViewModel):
            ZStack {
                Color.background.ignoresSafeArea()
                Module06NewsView(
                    appRouter: appRouter,
                    moduleRouter: self,
                    profileViewModel: profileViewModel,
                    simulationViewModel: simulationViewModel,
                    newsViewModel: newsViewModel
                )
                .frame(maxHeight: .infinity, alignment: .top)
            }
            .navigationBarBackButtonHidden()
            .onAppear(){
                if simulationViewModel.currentStage == nil {
                    simulationViewModel.currentStage = .openNews(appRouter: appRouter)
                    self.displayOverlay(
                        .withHanvestPopup(
                            title: "Instruction!",
                            desc: "Let's open one of the news",
                            dismissAction: {
                                // Do Nothing
                            }
                        )
                    )
                }
            }
            
        case .newsDetail(let appRouter, let news, let simulationViewModel):
            ZStack {
                Color.background.ignoresSafeArea()
                Module06NewsDetailsView(
                    moduleRouter: self,
                    news: news
                )
                .frame(maxHeight: .infinity, alignment: .top)
                .onAppear(){
                    if simulationViewModel.currentStage == .openNews(appRouter: appRouter) {
                        simulationViewModel.currentStage = .openNewsDetails(appRouter: appRouter)
                        self.displayOverlay(
                            .withHanvestPopup(
                                title: "Instruction!",
                                desc: "Read this news carefully, after reading it, go back to the simulation and decide if you want to buy or sell your stocks",
                                dismissAction: {
                                    // Do Nothing
                                }
                            )
                        )
                    }
                }
            }
            .navigationBarBackButtonHidden()
            
        case .conclusion(let appRouter, let simulationViewModel):
            ZStack {
                Color.background.ignoresSafeArea()
                Module06ConclusionView(
                    appRouter: appRouter,
                    moduleRouter: self,
                    simulationViewModel: simulationViewModel
                )
                .frame(maxHeight: .infinity, alignment: .top)
            }
            .navigationBarBackButtonHidden()
            
        }
    }
    
    @ViewBuilder
    func build(_ overlay: Module06Overlay) -> some View {
        switch overlay {
        case .withHanvestPopup(let title, let desc, let dismissAction):
            ZStack {
                Color.black.opacity(0.7).ignoresSafeArea().onTapGesture {
                    dismissAction()
                    self.dismissOverlay()
                }
                VStack(spacing: 8) {
                    HanvestPopup(title: title, description: desc)
                        .padding(.horizontal, 20)
                    Text("Tap anywhere to continue")
                        .font(.nunito(.subhead))
                        .foregroundStyle(.mineShaft50)
                }
            }
            
        case .withBuyConfirmationPopup(let buyingStockDataViewModel, let confirmAction, let cancelAction):
            ZStack {
                Color.black.opacity(0.7).ignoresSafeArea()
                
                SimulationBuyingConfirmationCard(
                    viewModel: buyingStockDataViewModel,
                    cancelAction: {
                        cancelAction()
                        self.dismissOverlay()
                    },
                    confirmAction: {
                        confirmAction()
                        self.dismissOverlay()
                    }
                )
                .padding(.horizontal, HanvestConstant.overlayHorizontalPaddingSimulation)
            }
            
        case .withSellConfirmationPopup(let sellingStockDataViewModel, let confirmAction, let cancelAction):
            ZStack {
                Color.black.opacity(0.7).ignoresSafeArea()
                
                SimulationSellingConfirmationCard(
                    viewModel: sellingStockDataViewModel,
                    cancelAction: {
                        cancelAction()
                        self.dismissOverlay()
                    },
                    confirmAction: {
                        confirmAction()
                        self.dismissOverlay()
                    }
                )
                .padding(.horizontal, HanvestConstant.overlayHorizontalPaddingSimulation)
            }
        }
    }

}
