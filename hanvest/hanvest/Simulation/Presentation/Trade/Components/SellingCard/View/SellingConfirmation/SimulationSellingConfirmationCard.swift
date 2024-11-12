//
//  Simulation.swift
//  hanvest
//
//  Created by Christian Gunawan on 16/10/24.
//

import SwiftUI

struct SimulationSellingConfirmationCard: View {
    var viewModel: SellingStockDataViewModel
    var cancelAction: () -> ()
    var confirmAction: () -> ()
    
    var body: some View {
        HanvestCardBackground {
            VStack(alignment: .center, spacing: 24){
                Text("Preview Sell Order").font(.nunito(.body))
                VStack(alignment: .leading, spacing: 12){
                    ConfirmationRow(title: "Stock", value: viewModel.selectedStockIDName.uppercased())
                    ConfirmationRow(title: "Price", value: "\(HanvestPriceFormatter.formatIntToIDR(viewModel.toSellStockPrice))")
                    ConfirmationRow(title: "Fee", value: "\(HanvestPriceFormatter.formatIntToIDR(viewModel.stockSellFee))")
                    ConfirmationRow(title: "Lot", value: "\(viewModel.stockSellLot)")
                    ConfirmationRow(title: "Amount", value: "\(HanvestPriceFormatter.formatIntToIDR(viewModel.stockSellAmount))")
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

#Preview {
    SimulationSellingConfirmationCard(
        viewModel: SellingStockDataViewModel(),
        cancelAction: {
            debugPrint("Cancel Action Pressed")
        },
        confirmAction: {
            debugPrint("Confirm Action Pressed")
        }
    )
}

