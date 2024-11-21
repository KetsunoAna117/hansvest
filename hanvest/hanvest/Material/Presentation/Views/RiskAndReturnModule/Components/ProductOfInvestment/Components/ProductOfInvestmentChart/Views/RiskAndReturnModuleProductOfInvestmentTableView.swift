//
//  HanvestModule03ProductOfInvestment.swift
//  hanvest
//
//  Created by Bryan Vernanda on 17/10/24.
//

import SwiftUI

struct RiskAndReturnModuleProductOfInvestmentTableView: View {
    // Constants
    let productStage: Int
    let productID: Int
    
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                VStack(spacing: 4) {
                    Text(getProductName())
                        .font(.nunito(.subhead, .bold))
                        .frame(maxWidth: .infinity)
                    
                    Text("Rp. \(getLastPrice()) \(countPercentage(productID: productID, productStage: productStage))")
                        .font(.nunito(.caption2))
                        .frame(maxWidth: .infinity)
                }
                .accessibilityElement(children: .combine)
                .accessibilityLabel(HanvestPriceFormatter.formatRupiahStringToSpelledOut("\(getProductName()) with equity Rp \(getLastPrice()) \(countPercentage(productID: productID, productStage: productStage))"))
            }
            .padding(.vertical, 8)
            .completionCardStyle()
            
            RiskAndReturnModuleProductOfInvestmentChart(
                viewmodel: HanvestProductPriceChartViewModel(
                    prices: ProductOfInvestmentEntity.getMockData()[productStage][productID].productPrices),
                symbolCategoryKeyPath: \.name
            )
            .completionCardStyle()
            .accessibilityElement(children: .combine)
            .accessibilityLabel("\(getProductName()) bar chart")
        }
        .frame(maxWidth: .infinity)
    }
    
    private func countPercentage(productID: Int, productStage: Int) -> String {
        guard let firstPrice = ProductOfInvestmentEntity.getMockData()[productStage][productID].productPrices.first?.price else {
            return "0.0%"
        }
        
        guard let lastPrice = ProductOfInvestmentEntity.getMockData()[productStage][productID].productPrices.last?.price else {
            return "0.0%"
        }
        
        let countPricePercentage = ((Double(lastPrice) - Double(firstPrice)) / Double(firstPrice)) * 100
        
        let formattedPercentage = String(format: "%+.1f%%", countPricePercentage)
        
        return formattedPercentage
    }
    
    private func getProductName() -> String {
        return ProductOfInvestmentEntity.getMockData()[productStage][productID].productName
    }
    
    private func getLastPrice() -> Int {
        if let lastPrice = ProductOfInvestmentEntity.getMockData()[productStage][productID].productPrices.last?.price {
            return lastPrice
        } else {
            return 0
        }
    }
    
}

#Preview {
    @Previewable let productStage = 0
    @Previewable let productID = 0
    
    RiskAndReturnModuleProductOfInvestmentTableView(
        productStage: productStage,
        productID: productID
    )
    .padding(.horizontal, 20)
    
}
