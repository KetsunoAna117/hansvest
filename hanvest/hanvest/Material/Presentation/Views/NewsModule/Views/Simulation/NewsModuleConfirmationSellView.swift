//
//  Module06ConfirmationSellView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 27/10/24.
//

import SwiftUI

struct NewsModuleConfirmationSellView: View {
    let moduleRouter: any NewsModuleRouterProtocol
    
    @ObservedObject var profileViewModel: NewsModuleProfileViewModel
    @ObservedObject var simulationViewModel: NewsModuleSimulationViewModel
    
    @StateObject var viewmodel = SellingStockDataViewModel()
    
    var body: some View {
        if let stock = simulationViewModel.selectedStock {
            VStack {
                HanvestNavigationBar(
                    label: "Sell \(stock.stockIDName)",
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
                    
                    SimulationSellingCard(
                        viewModel: viewmodel,
                        currentPrice: $simulationViewModel.displayActiveStockCurrentPrice
                    )
                }
                .padding(.horizontal, 20)
                .padding(.top, 24)
                
                Spacer()
                
                HanvestButtonDefault(
                    style: .filledCorrect(
                        isDisabled: viewmodel.determineIsDisabledButtonState()
                    ),
                    title: "Sell",
                    action: {
                        moduleRouter.displayOverlay(
                            .withSellConfirmationPopup(
                                sellingStockDataViewModel: viewmodel,
                                confirmAction: {
                                    moduleRouter.push(
                                        .transactionComplete(
                                            profileViewModel: profileViewModel,
                                            simulationViewModel: simulationViewModel,
                                            transactionViewModel:
                                                TransactionStatusViewModel(
                                                    lotAmount: viewmodel.stockSellLot,
                                                    stockPrice: viewmodel.toSellStockPrice,
                                                    selectedStockIDName: viewmodel.selectedStockIDName,
                                                    transactionType: .sell
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
