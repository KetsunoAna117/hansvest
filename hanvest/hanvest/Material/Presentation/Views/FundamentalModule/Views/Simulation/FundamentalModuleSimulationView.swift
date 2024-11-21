//
//  MaterialSimulationView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 25/10/24.
//

import SwiftUI

struct FundamentalModuleSimulationView: View {
    let appRouter: any AppRouterProtocol
    let moduleRouter: any FundamentalModuleRouterProtocol
    
    @ObservedObject var profileViewModel: FundamentalModuleProfileViewModel
    @ObservedObject var simulationViewModel: FundamentalModuleSimulationViewModel
    @ObservedObject var highlightViewModel: HanvestHighlightViewModel
    
    var body: some View {
        ZStack {
            VStack {
                VStack(spacing: 0) {
                    HanvestStockOptionList(
                        selectedStockID: $simulationViewModel.selectedStockID,
                        simulationStockList: simulationViewModel.stockList,
                        onPressed: { data in
                            
                        }
                    )
                    .showCase(
                        order: FundamentalModuleTipData.stocks.index,
                        title: FundamentalModuleTipData.stocks.title,
                        detail: FundamentalModuleTipData.stocks.detail,
                        stage: FundamentalModuleHighlightStage.mainStage.stringValue
                    )
                    
                    Divider()
                    
                    // Stock Detail
                    ScrollViewReader { scrollView in
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
                                        .id(FundamentalModuleTipData.stocks.index)
                                        .padding(.top, 12)
                                        
                                        HanvestStockPriceChart(
                                            viewmodel: HanvestProductPriceChartViewModel(
                                                prices: selectedStock.stockPrice),
                                            symbolCategoryKeyPath: \.name,
                                            displayBy: .hour
                                        )
                                        
                                        StockInvestmentDataView(
                                            userData: $profileViewModel.userData,
                                            selectedStock: selectedStock
                                        )
                                        .id(FundamentalModuleTipData.yourInvestment.index)
                                        
                                        StockCompanyProfileInformation(desc: selectedStock.stockDescription)
                                            .showCase(
                                                order: FundamentalModuleTipData.companyProfile.index,
                                                title: FundamentalModuleTipData.companyProfile.title,
                                                detail: FundamentalModuleTipData.companyProfile.detail,
                                                stage: FundamentalModuleHighlightStage.mainStage.stringValue
                                            )
                                            .id(FundamentalModuleTipData.companyProfile.index)
                                            .padding(.bottom, 12)
                                        
                                    }
                                }
                                else {
                                    Text("No Stock selected")
                                        .font(.nunito(.title2, .bold))
                                }
                                
                            }
                            .padding(.horizontal, 20)
                        }
                        .onChange(of: highlightViewModel.currentHighlight) { _, newValue in
                            if simulationViewModel.checkForCurrentHighlightedValue(newValue) {
                                withAnimation {
                                    scrollView.scrollTo(newValue, anchor: .top)
                                }
                            }
                        }
                    }
                    
                    // Button
                    VStack {
                        Divider()
                        
                        HStack(spacing: 12) {
                            HanvestButtonDefault(
                                size: .medium,
                                style: .filledIncorrect(
                                    isDisabled:
                                        simulationViewModel.currentStage == .sellStage(appRouter: appRouter) ? false : true
                                ),
                                title: "Sell") {
                                    moduleRouter.push(
                                        .confirmSell(
                                            profileViewModel: profileViewModel,
                                            simulationViewModel: simulationViewModel,
                                            highlightViewModel: highlightViewModel
                                        )
                                    )
                                    
                                    highlightViewModel.stage = FundamentalModuleHighlightStage.sellStage.stringValue
                                }
                                .showCase(
                                    order: FundamentalModuleTipData.sellButton.index,
                                    title: FundamentalModuleTipData.sellButton.title,
                                    detail: FundamentalModuleTipData.sellButton.detail,
                                    stage: FundamentalModuleHighlightStage.mainStage.stringValue
                                )
                            HanvestButtonDefault(
                                size: .medium,
                                style: .filledCorrect(
                                    isDisabled: simulationViewModel.currentStage == .buyStage(appRouter: appRouter) ? false : true
                                ),
                                title: "Buy") {
                                    moduleRouter.push(
                                        .confirmBuy(
                                            profileViewModel: profileViewModel,
                                            simulationViewModel: simulationViewModel,
                                            highlightViewModel: highlightViewModel
                                        )
                                    )
                                    
                                    highlightViewModel.stage = FundamentalModuleHighlightStage.buyStage.stringValue
                                }
                                .showCase(
                                    order: FundamentalModuleTipData.buyButton.index,
                                    title: FundamentalModuleTipData.buyButton.title,
                                    detail: FundamentalModuleTipData.buyButton.detail,
                                    stage: FundamentalModuleHighlightStage.mainStage.stringValue
                                )
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.bottom, 13)
                    
                    Divider()
                }
            }
        }
    }
    
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .materialFundamentalModule
    
    NavigationStack(path: $appRouter.path) {
        if let startScreen = startScreen {
            appRouter.build(startScreen)
                .navigationDestination(for: Screen.self) { screen in
                    appRouter.build(screen)
                }
        }
    }
}
