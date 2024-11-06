//
//  SimulationSellingCard.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 15/10/24.
//

import SwiftUI

struct SimulationSellingCard: View {
    @ObservedObject var viewModel: SellingStockDataViewModel
    @Binding var currentPrice: Int
    
    // Constant
    var priceRaise: Int = 25
    var lotRaise: Int = 1
    
    var body: some View {
        let amountState = viewModel.determineAmountState()
        
        HanvestCardBackground {
            VStack(spacing: 16) {
                HStack{
                    Text("Lot Available")
                        .font(.nunito(.body, .regular))
                    
                    Spacer()
                    
                    Text("\(viewModel.availableLot)")
                        .font(.nunito(.body, .bold))
                        .foregroundStyle(amountState.textColor)
                        .showCase(
                            order: Module05TipData.yourAmountOfStock.index,
                            title: Module05TipData.yourAmountOfStock.title,
                            detail: Module05TipData.yourAmountOfStock.detail,
                            stage: Module05HighlightStage.sellStage.stringValue
                        )
                }
                
                HStack{
                    HanvestSlider(value: $viewModel.stockSellLot, minimum: 0, maximum: viewModel.maximumStockSellLot())
                    
                    Spacer()
                    
                    Text("\(viewModel.calculateStockSellAmountPercentage()) %")
                        .font(.nunito(.body, .regular))
                        .foregroundStyle(amountState.textColor)
                }
                
                HStack{
                    Text("Amount")
                        .font(.nunito(.body, .regular))
                    
                    Spacer()
                    
                    Text("\(HanvestPriceFormatter.formatIntToIDR(viewModel.stockSellAmount))")
                        .font(.nunito(.body, .regular))
                        .showCase(
                            order: Module05TipData.amountSell.index,
                            title: Module05TipData.amountSell.title,
                            detail: Module05TipData.amountSell.detail,
                            stage: Module05HighlightStage.sellStage.stringValue
                        )
                }
                
                HStack{
                    Text("Price")
                        .font(.nunito(.body, .regular))
                        
                    Spacer()
                    
                    Text("\(currentPrice)")
                        .showCase(
                            order: Module05TipData.priceSell.index,
                            title: Module05TipData.priceSell.title,
                            detail: Module05TipData.priceSell.detail,
                            stage: Module05HighlightStage.sellStage.stringValue
                        )
                }
                
                HStack{
                    Text("Lot")
                        .font(.nunito(.body, .regular))
                    
                    Spacer()
                    
                    HanvestNumberStepper(
                        value: $viewModel.stockSellLot,
                        raise: lotRaise,
                        stage: Module05HighlightStage.sellStage.stringValue
                    )
                }
            }
            .onChange(of: currentPrice) { oldValue, newValue in
                viewModel.toSellStockPrice = newValue
                viewModel.validateStockSellAmount()
            }
        }
    }
}

#Preview {
    @Previewable @StateObject var viewmodel = SellingStockDataViewModel()
    @Previewable @State var currentPrice: Int = 5000
    
    @Inject var getUserData: GetUserData
    
    VStack {
        SimulationSellingCard(viewModel: viewmodel, currentPrice: $currentPrice)
            .onAppear(){
                guard let userData = getUserData.execute() else {
                    print("[ERROR] User Data is not initialized")
                    return
                }
                viewmodel.setup(
                    userData: userData,
                    selectedStockIDName: "BBRI",
                    initialStockPrice: 4000,
                    currentStockPrice: 5000
                )
            }
    }
    .padding(.horizontal, 16)
}
