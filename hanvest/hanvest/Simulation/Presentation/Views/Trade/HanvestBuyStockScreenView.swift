//
//  HanvestBuyConfirmationView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 17/10/24.
//

import SwiftUI

struct HanvestBuyStockScreenView: View {
    let router: any AppRouterProtocol
    
    @EnvironmentObject var simulationViewModel: HanvestSimulationViewModel
    @StateObject var viewmodel: BuyingStockDataViewModel = .init()
    
    var body: some View {
        if let stock = simulationViewModel.selectedStock {
            VStack {
                HanvestNavigationBar(
                    label: "Buy \(stock.stockIDName)",
                    leadingIcon: Image(systemName: "chevron.left"),
                    leadingAction: {
                        router.pop()
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
                        router.presentOverlay(
                            .withBuyConfirmationPopup(
                                viewmodel: viewmodel,
                                confirmAction: {
                                    router.push(
                                        .transactionStatus(
                                            transaction: TransactionStatusViewModel(
                                                lotAmount: viewmodel.stockBuyLot,
                                                stockPrice: viewmodel.toBuyStockPrice,
                                                selectedStockIDName: viewmodel.selectedStockIDName,
                                                transactionType: .buy
                                            )
                                        )
                                    )
                                },
                                cancelAction: {
                                    router.dismissPopup()
                                }
                            )
                        )
                        print("[!] User Buy Button Event Pressed!")
                    }
                )
                .padding(.bottom, 48)
            }
            .onAppear(){
                viewmodel.setup(
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

//#Preview {
//    @Previewable @StateObject var appRouter = AppRouter()
//    @Previewable @State var startScreen: Screen? = .simulationBuyingConfirmation
//    
//    NavigationStack(path: $appRouter.path) {
//        if let startScreen = startScreen {
//            appRouter.build(startScreen)
//                .navigationDestination(for: Screen.self) { screen in
//                    appRouter.build(screen)
//                }
//                .overlay {
//                    if let popup = appRouter.popup {
//                        ZStack {
//                            appRouter.build(popup)
//                        }
//                       
//                    }
//                }
//        }
//    }
//    .onAppear(){
//        appRouter.simulationViewModel?.selectedStock = SimulationStockEntity.getMockData().first!
//    }
//}
