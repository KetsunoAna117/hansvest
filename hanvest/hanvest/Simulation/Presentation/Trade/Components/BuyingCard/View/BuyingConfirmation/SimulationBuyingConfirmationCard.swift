//
//  SimulationBuyingConfirmationCard.swift
//  hanvest
//
//  Created by Christian Gunawan on 15/10/24.
//

import SwiftUI

struct SimulationBuyingConfirmationCard: View {
    var viewModel: BuyingStockDataViewModel
    var cancelAction: () -> ()
    var confirmAction: () -> ()
    
    var body: some View {
        HanvestCardBackground {
            VStack(alignment: .center, spacing: 24){
                Text("Preview Buy Order").font(.nunito(.body))
                VStack(alignment: .leading, spacing: 12){
                    ConfirmationRow(title: "Stock", value: viewModel.selectedStockIDName.uppercased())
                    ConfirmationRow(title: "Price", value: "\(HanvestPriceFormatter.formatIntToIDR(viewModel.toBuyStockPrice))")
                    ConfirmationRow(title: "Fee", value: "\(HanvestPriceFormatter.formatIntToIDR(viewModel.stockBuyFee))")
                    ConfirmationRow(title: "Lot", value: "\(viewModel.stockBuyLot)")
                    ConfirmationRow(title: "Amount", value: "\(HanvestPriceFormatter.formatIntToIDR(viewModel.stockBuyAmount))")
                }
                
                HStack{
                    HanvestButtonDefault(
                        size: .medium,
                        style: .filledIncorrect(isDisabled: false),
                        iconPosition: .leading,
                        title: "Cancel",
                        action: cancelAction
                    )
                    HanvestButtonDefault(
                        size: .medium,
                        style: .filledCorrect(isDisabled: false),
                        iconPosition: .leading,
                        title: "Confirm",
                        action: confirmAction
                    )
                }
            }
            .padding(16)
        }
    }
}

//#Preview {
//    SimulationBuyingConfirmationCard(
//        viewModel: BuyingStockDataViewModel(),
//        cancelAction: {
//            debugPrint("Cancel Action Pressed")
//        },
//        confirmAction: {
//            debugPrint("Confirm Action Pressed")
//        }
//    )
//}
//
