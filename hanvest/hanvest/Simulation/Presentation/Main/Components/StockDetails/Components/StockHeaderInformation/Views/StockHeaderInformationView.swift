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
                                order: FundamentalModuleTipData.stocksName.index,
                                title: FundamentalModuleTipData.stocksName.title,
                                detail: FundamentalModuleTipData.stocksName.detail,
                                stage: FundamentalModuleHighlightStage.mainStage.stringValue
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
                                order: FundamentalModuleTipData.stocksPrice.index,
                                title: FundamentalModuleTipData.stocksPrice.title,
                                detail: FundamentalModuleTipData.stocksPrice.detail,
                                stage: FundamentalModuleHighlightStage.mainStage.stringValue
                            )
                            .accessibilityLabel(HanvestPriceFormatter.formatRupiahStringToSpelledOut(HanvestPriceFormatter.formatIntToIDR(currentPrice)))
                        HanvestProfitLossLabelView(
                            initialValue: $initialPrice,
                            currentValue: $currentPrice
                        )
                        .showCase(
                            order: FundamentalModuleTipData.gainLoss.index,
                            title: FundamentalModuleTipData.gainLoss.title,
                            detail: FundamentalModuleTipData.gainLoss.detail,
                            stage: FundamentalModuleHighlightStage.mainStage.stringValue
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
