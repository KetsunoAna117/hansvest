//
//  Module06Router.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 27/10/24.
//

import SwiftUI

class Module06Router: Module06RouterProtocol {
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
        self.overlay = overlay
    }
    
    func dismissOverlay() {
        self.overlay = nil
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
                            // User can't use this button in this module, hence this will do nothing.
                        },
                        profileIconTappedAction: {
                            self.push(
                                .notification(
                                    profileViewModel: profileViewModel,
                                    simulationViewModel: simulationViewModel,
                                    notificationViewModel: newsViewModel
                                )
                            )
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
            
        case .confirmBuy(let profileViewModel, let simulationViewModel):
            ZStack {
                Color.background.ignoresSafeArea()
                Module06ConfirmationBuyView(
                    moduleRouter: self,
                    profileViewModel: profileViewModel,
                    simulationViewModel: simulationViewModel
                )
            }
            .navigationBarBackButtonHidden()
            
        case .confirmSell(let profileViewModel, let simulationViewModel):
            ZStack {
                Color.background.ignoresSafeArea()
                Module06ConfirmationSellView(
                    moduleRouter: self,
                    profileViewModel: profileViewModel,
                    simulationViewModel: simulationViewModel
                )
            }
            .navigationBarBackButtonHidden()
            
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
            
        case .notification(let profileViewModel, let simulationViewModel, let newsViewModel):
            ZStack {
                Color.background.ignoresSafeArea()
                Module06NewsView(
                    moduleRouter: self,
                    profileViewModel: profileViewModel,
                    simulationViewModel: simulationViewModel,
                    newsViewModel: newsViewModel
                )
            }
            .navigationBarBackButtonHidden()
            
        case .newsDetail(let news):
            ZStack {
                Color.background.ignoresSafeArea()
                Module06NewsDetailsView(
                    moduleRouter: self,
                    news: news
                )
            }
            .navigationBarBackButtonHidden()
            
        }
    }

}
