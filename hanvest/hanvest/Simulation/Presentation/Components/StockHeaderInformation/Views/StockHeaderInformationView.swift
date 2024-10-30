//
//  StockHeaderInformationView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/10/24.
//

import SwiftUI

struct StockHeaderInformationView: View {
    var stockCodeName: String
    var stockName: String
    
    @Binding var initialPrice: Int
    @Binding var currentPrice: Int
    
    var body: some View {
        VStack {
            HanvestCardBackground {
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(stockCodeName)
                            .font(.nunito(.largeTitle, .bold))
                            .showCase(
                                order: Module05TipData.stocksName.index,
                                title: Module05TipData.stocksName.title,
                                detail: Module05TipData.stocksName.detail,
                                stage: .mainStage
                            )
                        Text(stockName)
                            .font(.nunito(.caption1))
                            .padding(.top, -5)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text(HanvestPriceFormatter.formatIntToIDR(currentPrice))
                            .font(.nunito(.title2, .bold))
                            .showCase(
                                order: Module05TipData.stocksPrice.index,
                                title: Module05TipData.stocksPrice.title,
                                detail: Module05TipData.stocksPrice.detail,
                                stage: .mainStage
                            )
                        HanvestProfitLossLabelView(
                            initialValue: $initialPrice,
                            currentValue: $currentPrice
                        )
                        .showCase(
                            order: Module05TipData.gainLoss.index,
                            title: Module05TipData.gainLoss.title,
                            detail: Module05TipData.gainLoss.detail,
                            stage: .mainStage
                        )
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable
    @State var currentPrice: Int = 5300
    
    @Previewable
    @State var initialPrice: Int = 5000
    
    StockHeaderInformationView(
        stockCodeName: "BBRI",
        stockName: "PT. Bank Rakyat Indonesia Tbk.",
        initialPrice: $initialPrice,
        currentPrice: $currentPrice
    )
}
