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
        self.progress += 1
    }
    
    func pop() {
        if self.content.count <= 1 {
            return
        }
        
        self.content.removeLast()
        self.progress -= 1
    }
    
    func popToRoot(){
        self.content.removeLast(content.count - 1)
        self.progress = 0
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
            
        case .confirmBuy:
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    Text("Hello from confirm Buy Stage")

                }
            }
            .navigationBarBackButtonHidden()
            
        case .confirmSell:
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    Text("Hello from confirm sell Stage")
  
                }
            }
            .navigationBarBackButtonHidden()
            
        case .transactionComplete:
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    Text("Hello from transaction complete Stage")
                }
            }
            .navigationBarBackButtonHidden()
            
        }
    }
    
    
}
