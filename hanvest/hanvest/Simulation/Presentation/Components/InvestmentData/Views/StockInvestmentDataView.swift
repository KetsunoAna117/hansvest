//
//  StockInvestmentData.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 14/10/24.
//

import SwiftUI

struct StockInvestmentDataView: View {
    var userData: UserDataEntity
    var selectedStock: StockEntity
    
    @StateObject private var viewmodel: StockInvestmentDataViewModels = .init()
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Your Investment in \(selectedStock.stockIDName)")
                            .font(.nunito(.subhead))
                        Text(HanvestPriceFormatter.formatIntToIDR(viewmodel.userStockInvestment))
                            .font(.nunito(.subhead, .bold))
                    }
                    
                    Rectangle()
                        .foregroundStyle(.tertiary)
                        .frame(maxWidth: 1, maxHeight: 36)
                        .padding(.horizontal, 4)
                    
                    VStack(alignment: .trailing) {
                        Text("Total Equity in \(selectedStock.stockIDName)")
                            .font(.nunito(.subhead))
                        Text(HanvestPriceFormatter.formatIntToIDR(viewmodel.userTotalEquity))
                            .font(.nunito(.subhead, .bold))
                    }
                    
                    
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 12)
                
                VStack {
                    HStack {
                        Text("P/L: Rp ")
                            .font(.nunito(.subhead, .bold))
                        HanvestProfitLossLabelView(
                            initialValue: $viewmodel.userStockInvestment,
                            currentValue: $viewmodel.userTotalEquity
                        )
                    }
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                }
                .background(
                    Rectangle()
                        .stroke(.mineShaft200, lineWidth: 1)
                        .background(
                            Rectangle()
                                .fill(.seagull100)
                        )
                        .clipShape(
                            .rect(
                                bottomLeadingRadius: 12, bottomTrailingRadius: 12
                            )
                        )
                )
                
            }
            
        }
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.mineShaft200, lineWidth: 1)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.mineShaft50)
                )
        )
        .onAppear(){
            viewmodel.setup(
                userData: userData,
                selectedStockIDName: selectedStock.stockIDName,
                stockPrice: selectedStock.stockPrice.last?.price ?? 0
            )
            print("User Balance: \(userData.userBalance)")
        }
        .onChange(of: selectedStock.stockPrice) { oldValue, newValue in
            viewmodel.setup(
                userData: userData,
                selectedStockIDName: selectedStock.stockIDName,
                stockPrice: selectedStock.stockPrice.last?.price ?? 0
            )
        }
        .onChange(of: userData.userBalance) { oldValue, newValue in
            viewmodel.setup(
                userData: userData,
                selectedStockIDName: selectedStock.stockIDName,
                stockPrice: selectedStock.stockPrice.last?.price ?? 0
            )
        }
    }
}

//#Preview {
//    @Previewable @State var selectedStock = StockEntity.getMockData().first!
//    
//    StockInvestmentData(
//        selectedStock: selectedStock
//    )
//    .padding(20)
//}
