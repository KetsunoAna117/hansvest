//
//  HanvestSimulationView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import SwiftUI

struct HanvestSimulationView: View {
    let router: any AppRouterProtocol
    @ObservedObject var userDataViewModel: HanvestLoadedUserDataViewModel
    @ObservedObject var simulationViewModel: HanvestSimulationViewModel
    
    var body: some View {
        ZStack {
            if let userData = userDataViewModel.userData {
                VStack {
                    VStack {
                        HanvestStockOptionList(
                            selectedStockID: $simulationViewModel.selectedStockID,
                            simulationStockList: simulationViewModel.stockList,
                            onPressed: { data in
                                
                            }
                        )
                        
                        Divider()
                        
                        if let userData = userDataViewModel.userData {
                            SimulationStockDetailsView(
                                router: router,
                                userData: userData,
                                viewmodel: simulationViewModel
                            )
                            .padding(.top, 12)
                        }
                        
     
                        
                        Divider()
                            .padding(.top, -6)
                        
                        VStack {
                            HStack(spacing: 12) {
                                HanvestButtonDefault(
                                    size: .medium,
                                    style: .filledIncorrect(isDisabled: false),
                                    title: "Sell") {
                                        router.push(
                                            .simulationSellingConfirmation(
                                                viewModel: simulationViewModel,
                                                userData: userData
                                            )
                                        )
                                    }
                                HanvestButtonDefault(
                                    size: .medium,
                                    style: .filledCorrect(isDisabled: false),
                                    title: "Buy") {
                                        router.push(
                                            .simulationBuyingConfirmation(
                                                viewModel: simulationViewModel,
                                                userData: userData
                                            )
                                        )
                                    }
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 13)
                        
                        Divider()
                    }
                }
            }
            else {
                Text("ERROR: No User Data Detected")
            }
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
        }
    }
    .overlay {
        if let popup = appRouter.popup {
            ZStack {
                appRouter.build(popup)
            }
           
        }
    }
}
