//
//  AllStockProductOfInvestmentViews.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

struct RiskAndReturnModuleProductOfInvestmentView: View {
    // Constants
    let title: String
    let selectedProductIndex: Int
    let productStage: Int
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 0) {
                Text(title)
                    .font(.nunito(.title2))
                    .frame(maxWidth: .infinity)
                
                Text("Equity: Rp. \(getLastProductOfInvestmentPrice())")
                    .font(.nunito(.callout))
                    .frame(maxWidth: .infinity)
            }
            .multilineTextAlignment(.center)
            .accessibilityElement(children: .combine)
            .accessibilityLabel(HanvestPriceFormatter.formatRupiahStringToSpelledOut("\(title) with your equity Rp \(getLastProductOfInvestmentPrice())"))
            
            ScrollView(.vertical) {
                VStack(spacing: 24) {
                    ForEach(ProductOfInvestmentEntity.getMockData()[productStage].indices, id: \.self) { productID in
                        RiskAndReturnModuleProductOfInvestmentTableView(
                            productStage: productStage,
                            productID: productID
                        )
                    }
                }
                .frame(maxWidth: .infinity)
            }
            
        }
        .frame(maxWidth: .infinity)
    }
    
    func getLastProductOfInvestmentPrice() -> Int {
        if let lastPrice = ProductOfInvestmentEntity.getMockData()[productStage][selectedProductIndex].productPrices.last?.price {
            return lastPrice
        } else {
            return 0
        }
    }

}

#Preview {
    @Previewable let headerText = "Header Text"
    @Previewable let productStage = 0
    @Previewable let productID = 0
    @Previewable let selectedProductIndex = 0
    
    RiskAndReturnModuleProductOfInvestmentView(
        title: headerText,
        selectedProductIndex: 0,
        productStage: productStage
    )
    .padding(.horizontal, 20)
}
