//
//  SimulationStockDetailsView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/10/24.
//

import SwiftUI

struct SimulationStockDetailsView: View {
    let router: any AppRouterProtocol
    
    @Binding var userData: UserDataEntity?
    @ObservedObject var viewmodel: HanvestSimulationViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                if let selectedStock = viewmodel.selectedStock {
                    VStack {
                        StockHeaderInformationView(
                            stockCodeName: selectedStock.stockIDName,
                            stockName: selectedStock.stockName,
                            initialPrice: $viewmodel.displayActiveStockInitialPrice,
                            currentPrice: $viewmodel.displayActiveStockCurrentPrice
                        )
                        
                        HanvestStockPriceChart(
                            viewmodel: HanvestProductPriceChartViewModel(
                                prices: selectedStock.stockPrice),
                            symbolCategoryKeyPath: \.name,
                            displayBy: .hour
                        )
                        
                        StockInvestmentDataView(
                            userData: $userData,
                            selectedStock: selectedStock
                        )
                        
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
