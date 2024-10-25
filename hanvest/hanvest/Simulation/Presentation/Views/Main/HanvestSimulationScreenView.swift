//
//  HanvestSimulationView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import SwiftUI

struct HanvestSimulationView: View {
    let router: any AppRouterProtocol
    @ObservedObject var viewmodel: HanvestSimulationViewModel
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    HanvestStockOptionList(
                        selectedStockID: $viewmodel.selectedStockID,
                        simulationStockList: viewmodel.stockList,
                        onPressed: { data in
                            
                        }
                    )
                    
                    Divider()
                    
                    SimulationStockDetailsView(
                        router: router
                    )
                    .padding(.top, 12)
                    .environmentObject(viewmodel)
                    
                    Divider()
                        .padding(.top, -6)
                    
                    VStack {
                        HStack(spacing: 12) {
                            HanvestButtonDefault(
                                size: .medium,
                                style: .filledIncorrect(isDisabled: false),
                                title: "Sell") {
                                    router.push(
                                        .simulationSellingConfirmation(viewModel: viewmodel)
                                    )
                                }
                            HanvestButtonDefault(
                                size: .medium,
                                style: .filledCorrect(isDisabled: false),
                                title: "Buy") {
                                    router.push(
                                        .simulationBuyingConfirmation(viewModel: viewmodel)
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
