//
//  Module06ConfirmationBuyView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 27/10/24.
//

import SwiftUI

struct NewsModuleConfirmationBuyView: View {
    let moduleRouter: any NewsModuleRouterProtocol
    
    @ObservedObject var profileViewModel: NewsModuleProfileViewModel
    @ObservedObject var simulationViewModel: NewsModuleSimulationViewModel
    
    @StateObject var viewmodel = BuyingStockDataViewModel()
    
    var body: some View {
        if let stock = simulationViewModel.selectedStock {
            VStack {
                HanvestNavigationBar(
                    label: "Buy \(stock.stockIDName)",
                    leadingIcon: Image(systemName: "chevron.left"),
                    leadingAction: {
                        moduleRouter.pop()
                    }
                )
                
                VStack(spacing: 24) {
                    StockHeaderInformationView(
                        stockCodeName: stock.stockIDName,
                        stockName: stock.stockName,
                        initialPrice: $simulationViewModel.displayActiveStockInitialPrice,
                        currentPrice:
                            $simulationViewModel.displayActiveStockCurrentPrice
                    )
                    
                    SimulationBuyingCard(viewModel: viewmodel, currentPrice: $simulationViewModel.displayActiveStockCurrentPrice)
                }
                .padding(.horizontal, 20)
                .padding(.top, 24)
                
                Spacer()
                
                HanvestButtonDefault(
                    style: .filledCorrect(
                        isDisabled: viewmodel.determineIsDisabledButtonState()
                    ),
                    title: "Buy",
                    action: {
                        moduleRouter.displayOverlay(
                            .withBuyConfirmationPopup(
                                buyingStockDataViewModel: viewmodel,
                                confirmAction: {
                                    moduleRouter.push(
                                        .transactionComplete(
                                            profileViewModel: profileViewModel,
                                            simulationViewModel: simulationViewModel,
                                            transactionViewModel: TransactionStatusViewModel(
                                                lotAmount: viewmodel.stockBuyLot,
                                                stockPrice: viewmodel.toBuyStockPrice,
                                                selectedStockIDName: viewmodel.selectedStockIDName,
                                                transactionType: .buy
                                            )
                                        )
                                    )
                                },
                                cancelAction: {
                                    moduleRouter.dismissOverlay()
                                }
                            )
                        )
                    }
                )
                .padding(.bottom, 48)
                .padding(.horizontal, 20)
            }
            .onAppear(){
                viewmodel.setup(
                    userData: profileViewModel.userData,
                    selectedStockIDName: stock.stockIDName,
                    initialStockPrice: stock.stockPrice.first?.price ?? 0,
                    currentStockPrice: stock.stockPrice.last?.price ?? 0
                )
            }
        }
        else {
            Text("Error! No Stock Selected!")
        }
    }
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .materialNewsModule
    
    NavigationStack(path: $appRouter.path) {
        if let startScreen = startScreen {
            appRouter.build(startScreen)
                .navigationDestination(for: Screen.self) { screen in
                    appRouter.build(screen)
                }
        }
    }
}
