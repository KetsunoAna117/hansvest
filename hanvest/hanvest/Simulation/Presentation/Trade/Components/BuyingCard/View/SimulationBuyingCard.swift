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
                            order: FundamentalModuleTipData.tradingBalance.index,
                            title: FundamentalModuleTipData.tradingBalance.title,
                            detail: FundamentalModuleTipData.tradingBalance.detail,
                            stage: FundamentalModuleHighlightStage.buyStage.stringValue
                        )
                        .accessibilityLabel(HanvestPriceFormatter.formatRupiahStringToSpelledOut(HanvestPriceFormatter.formatIntToIDR(viewModel.tradingBalance)))
                }
                
                HStack{
                    HanvestSlider(value: $viewModel.stockBuyLot, minimum: 0, maximum: viewModel.maximumStockBuyLot())
                        .padding(.trailing, 12)
                    
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
                            order: FundamentalModuleTipData.amountBuy.index,
                            title: FundamentalModuleTipData.amountBuy.title,
                            detail: FundamentalModuleTipData.amountBuy.detail,
                            stage: FundamentalModuleHighlightStage.buyStage.stringValue
                        )
                        .accessibilityLabel(HanvestPriceFormatter.formatRupiahStringToSpelledOut(HanvestPriceFormatter.formatIntToIDR(viewModel.stockBuyAmount)))
                }
                
                HStack{
                    Text("Price")
                        .font(.nunito(.body, .regular))
                        
                    Spacer()
                    
                    Text("\(currentPrice)")
                        .showCase(
                            order: FundamentalModuleTipData.priceBuy.index,
                            title: FundamentalModuleTipData.priceBuy.title,
                            detail: FundamentalModuleTipData.priceBuy.detail,
                            stage: FundamentalModuleHighlightStage.buyStage.stringValue
                        )
                        .accessibilityLabel(HanvestPriceFormatter.formatRupiahStringToSpelledOut("\(currentPrice)"))
                }
                
                HStack{
                    Text("Lot")
                        .font(.nunito(.body, .regular))
                    
                    Spacer()
                    
                    HanvestNumberStepper(
                        value: $viewModel.stockBuyLot,
                        raise: lotRaise,
                        stage: FundamentalModuleHighlightStage.buyStage.stringValue
                    )
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
