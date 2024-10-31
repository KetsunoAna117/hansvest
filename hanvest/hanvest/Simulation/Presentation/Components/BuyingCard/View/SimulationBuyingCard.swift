//
//  SimulationBuyingCard.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 14/10/24.
//

import SwiftUI

struct SimulationBuyingCard: View {
    @ObservedObject var viewModel: BuyingStockDataViewModel
    @Binding var currentPrice: Int
    
    // Constant
    let priceRaise: Int = 25
    var lotRaise: Int = 1
    
    var body: some View {
        let amountState = viewModel.determineAmountState()
        
        HanvestCardBackground {
            VStack(spacing: 16) {
                HStack{
                    Text("Trading Balance")
                        .font(.nunito(.body, .regular))
                    
                    Spacer()
                    
                    Text("\(HanvestPriceFormatter.formatIntToIDR(viewModel.tradingBalance))")
                        .font(.nunito(.body, .bold))
                        .showCase(
                            order: Module05TipData.tradingBalance.index,
                            title: Module05TipData.tradingBalance.title,
                            detail: Module05TipData.tradingBalance.detail,
                            stage: .buyStage
                        )
                }
                
                HStack{
                    HanvestSlider(value: $viewModel.stockBuyLot, minimum: 0, maximum: viewModel.maximumStockBuyLot())
                    
                    Spacer()
                    
                    
                    Text("\(viewModel.calculateStockBuyAmountPercentage()) %")
                        .font(.nunito(.body, .regular))
                        .foregroundStyle(amountState.textColor)
                }
                
                HStack{
                    Text("Amount")
                        .font(.nunito(.body, .regular))
                    
                    Spacer()
                    
                    Text("\(HanvestPriceFormatter.formatIntToIDR(viewModel.stockBuyAmount))")
                        .font(.nunito(.body, .regular))
                        .foregroundStyle(amountState.textColor)
                        .showCase(
                            order: Module05TipData.amountBuy.index,
                            title: Module05TipData.amountBuy.title,
                            detail: Module05TipData.amountBuy.detail,
                            stage: .buyStage
                        )
                }
                
                HStack{
                    Text("Price")
                        .font(.nunito(.body, .regular))
                        
                    Spacer()
                    
                    Text("\(currentPrice)")
                        .showCase(
                            order: Module05TipData.priceBuy.index,
                            title: Module05TipData.priceBuy.title,
                            detail: Module05TipData.priceBuy.detail,
                            stage: .buyStage
                        )
                }
                
                HStack{
                    Text("Lot")
                        .font(.nunito(.body, .regular))
                    
                    Spacer()
                    
                    HanvestNumberStepper(value: $viewModel.stockBuyLot, raise: lotRaise)
                }
            }
            .onChange(of: currentPrice) { oldValue, newValue in
                viewModel.toBuyStockPrice = newValue
                viewModel.validateStockBuyAmount()
            }
        }
    }
}

#Preview {
    @Previewable @StateObject var viewmodel = BuyingStockDataViewModel()
    @Previewable @State var currentPrice: Int = 5000
    
    VStack {
        @Inject var getUserData: GetUserData
        SimulationBuyingCard(viewModel: viewmodel, currentPrice: $currentPrice)
            .onAppear(){
                viewmodel.setup(
                    userData: getUserData.execute(),
                    selectedStockIDName: "BBCA",
                    initialStockPrice: 40,
                    currentStockPrice: 50
                )
            }
    }
    .padding(.horizontal, 16)
}
