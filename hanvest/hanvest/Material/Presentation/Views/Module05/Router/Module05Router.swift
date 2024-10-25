//
//  Module05Router.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 24/10/24.
//

import Foundation
import SwiftUI

class Module05Router: Module05RouterProtocol, ObservableObject {
    @Published var content: [Module05ContentView] = []
    
    @Published var overlay: Module05Overlay?
    
    @Published var progress: Int = 0
    
    func push(_ content: Module05ContentView) {
        self.content.append(content)
    }
    
    func pop() {
        if self.content.count <= 1 {
            return
        }
        
        self.content.removeLast()
    }
    
    func popToRoot(){
        self.content.removeLast(content.count - 1)
    }
    
    func displayOverlay(_ overlay: Module05Overlay) {
        self.overlay = overlay
    }
    
    func dismissOverlay() {
        self.overlay = nil
    }
    
    @ViewBuilder
    func build(_ content: Module05ContentView) -> some View {
        switch content {
        case .buyStage(let profileViewModel, let simulationViewModel):
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    ModuleHeaderView(
                        viewmodel: profileViewModel,
                        bookIconTappedAction: {
                            // User can't use this button in this module, hence this will do nothing.
                        },
                        bellIconTappedAction: {
                            // User can't use this button in this module, hence this will do nothing.
                        },
                        profileIconTappedAction: {
                            // User can't use this button in this module, hence this will do nothing.
                        }
                    )
                    MaterialSimulationView(
                        moduleRouter: self,
                        profileViewModel: profileViewModel,
                        simulationViewModel: simulationViewModel
                    )
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
            .navigationBarBackButtonHidden()
            
        case .sellStage(let profileViewModel, let simulationViewModel):
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    ModuleHeaderView(
                        viewmodel: profileViewModel,
                        bookIconTappedAction: {
                            // User can't use this button in this module, hence this will do nothing.
                        },
                        bellIconTappedAction: {
                            // User can't use this button in this module, hence this will do nothing.
                        },
                        profileIconTappedAction: {
                            // User can't use this button in this module, hence this will do nothing.
                        }
                    )
                    MaterialSimulationView(
                        moduleRouter: self,
                        profileViewModel: profileViewModel,
                        simulationViewModel: simulationViewModel
                    )
                }
                .frame(maxHeight: .infinity, alignment: .top)

            }
            .navigationBarBackButtonHidden()
            
        case .confirmBuy(
            let profileViewModel,
            let simulationViewModel
        ):
            ZStack {
                Color.background.ignoresSafeArea()
                MaterialSimulationConfirmationBuyView(
                    moduleRouter: self,
                    profileViewModel: profileViewModel,
                    simulationViewModel: simulationViewModel
                )
            }
            .navigationBarBackButtonHidden()
            .overlay {
                if let popup = overlay {
                    ZStack {
                        self.build(popup)
                    }
                    // Apply transition and animation
                    .transition(.opacity) // You can use other transitions like .scale, .move, etc.
                    .animation(.easeInOut(duration: 0.3), value: self.overlay)
                }
            }
            
        case .confirmSell:
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    Text("Hello from confirm sell Stage")
  
                }
            }
            .navigationBarBackButtonHidden()
            .overlay {
                if let popup = overlay {
                    ZStack {
                        self.build(popup)
                    }
                    // Apply transition and animation
                    .transition(.opacity) // You can use other transitions like .scale, .move, etc.
                    .animation(.easeInOut(duration: 0.3), value: self.overlay)
                }
            }
            
        case .transactionComplete(
            let profileViewModel,
            let simulationViewModel,
            let transactionViewModel
        ):
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    MaterialTransactionStatusView(
                        moduleRouter: self,
                        profileViewModel: profileViewModel,
                        simulationViewModel: simulationViewModel,
                        transaction: transactionViewModel
                    )
                }
            }
            .navigationBarBackButtonHidden()
            
        }
    }
    
    @ViewBuilder
    func build(_ overlay: Module05Overlay) -> some View {
        switch overlay {
        case .withBuyConfirmationPopup(
            let buyingStockViewModel,
            let confirmAction,
            let cancelAction
        ):
            ZStack {
                Color.black.opacity(0.7).ignoresSafeArea()
                
                SimulationBuyingConfirmationCard(
                    viewModel: buyingStockViewModel,
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
            
        case .withSellConfirmationPopup(
            let sellingStockViewModel,
            let confirmAction,
            let cancelAction
        ):
            ZStack {
                Color.black.opacity(0.7).ignoresSafeArea()
                
                SimulationSellingConfirmationCard(
                    viewModel: sellingStockViewModel,
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
