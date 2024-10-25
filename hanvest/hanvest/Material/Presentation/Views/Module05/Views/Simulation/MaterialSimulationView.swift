//
//  MaterialSimulationView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 25/10/24.
//

import SwiftUI

struct MaterialSimulationView: View {
    let moduleRouter: any Module05RouterProtocol
    
    @ObservedObject var profileViewModel: Module05ProfileViewModel
    @ObservedObject var simulationViewModel: HanvestSimulationViewModel
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    HanvestStockOptionList(
                        selectedStockID: $simulationViewModel.selectedStockID,
                        simulationStockList: simulationViewModel.stockList,
                        onPressed: { data in
                            
                        }
                    )
                    
                    Divider()
                    
                    // Stock Detail
                    ScrollView {
                        VStack(spacing: 24) {
                            if let selectedStock = simulationViewModel.selectedStock {
                                VStack(spacing: 16) {
                                    StockHeaderInformationView(
                                        stockCodeName: selectedStock.stockIDName,
                                        stockName: selectedStock.stockName,
                                        initialPrice: $simulationViewModel.displayActiveStockInitialPrice,
                                        currentPrice: $simulationViewModel.displayActiveStockCurrentPrice
                                    )
                                    
                                    HanvestStockPriceChart(
                                        viewmodel: HanvestProductPriceChartViewModel(
                                            prices: selectedStock.stockPrice),
                                        symbolCategoryKeyPath: \.name,
                                        displayBy: .hour
                                    )
                                    StockInvestmentData(selectedStock: selectedStock)
                                    
                                    StockCompanyProfileInformation(desc: selectedStock.stockDescription)
                                    
                                }
                            }
                            else {
                                Text("No Stock selected")
                                    .font(.nunito(.title2, .bold))
                            }
                            
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.top, 12)
                    
                    Divider()
                        .padding(.top, -6)
                    
                    // Button
                    VStack {
                        HStack(spacing: 12) {
                            HanvestButtonDefault(
                                size: .medium,
                                style: .filledIncorrect(isDisabled: false),
                                title: "Sell") {
                                    moduleRouter.push(
                                        .confirmSell(
                                            profileViewModel: profileViewModel,
                                            simulationViewModel: simulationViewModel
                                        )
                                    )
                                }
                            HanvestButtonDefault(
                                size: .medium,
                                style: .filledCorrect(isDisabled: false),
                                title: "Buy") {
                                    moduleRouter.push(
                                        .confirmBuy(
                                            profileViewModel: profileViewModel,
                                            simulationViewModel: simulationViewModel
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
    }
    
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .materialModule05
    
    NavigationStack(path: $appRouter.path) {
        if let startScreen = startScreen {
            appRouter.build(startScreen)
                .navigationDestination(for: Screen.self) { screen in
                    appRouter.build(screen)
                }
        }
    }
}
