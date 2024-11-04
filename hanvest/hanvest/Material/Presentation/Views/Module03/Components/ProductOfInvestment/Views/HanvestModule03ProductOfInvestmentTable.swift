//
//  HanvestModule03ProductOfInvestment.swift
//  hanvest
//
//  Created by Bryan Vernanda on 17/10/24.
//

import SwiftUI

struct HanvestProductOfInvestmentTable: View {
    // Constants
    let productStage: Int
    let productID: Int
    
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                VStack(spacing: 4) {
                    Text(Module03ProductOfInvestmentEntity.getMockData()[productStage][productID].productName)
                        .font(.nunito(.subhead, .bold))
                        .frame(maxWidth: .infinity)
                    
                    if let lastPrice = Module03ProductOfInvestmentEntity.getMockData()[productStage][productID].productPrices.last?.price {
                        
                        Text("Rp. \(lastPrice) \(countPercentage(productID: productID, productStage: productStage))")
                            .font(.nunito(.caption2))
                            .frame(maxWidth: .infinity)
                        
                    }
                }
            }
            .padding(.vertical, 8)
            .completionCardStyle()
            
            
            HanvestModule03ProductOfInvestmentChart(
                viewmodel: HanvestProductPriceChartViewModel(
                    prices: Module03ProductOfInvestmentEntity.getMockData()[productStage][productID].productPrices),
                symbolCategoryKeyPath: \.name
            )
            .completionCardStyle()
        }
        .frame(maxWidth: .infinity)
    }
    
    private func countPercentage(productID: Int, productStage: Int) -> String {
        guard let firstPrice = Module03ProductOfInvestmentEntity.getMockData()[productStage][productID].productPrices.first?.price else {
            return "0.0%"
        }
        
        guard let lastPrice = Module03ProductOfInvestmentEntity.getMockData()[productStage][productID].productPrices.last?.price else {
            return "0.0%"
        }
        
        let countPricePercentage = ((Double(lastPrice) - Double(firstPrice)) / Double(firstPrice)) * 100
        
        let formattedPercentage = String(format: "%+.1f%%", countPricePercentage)
        
        return formattedPercentage
    }
    
}

#Preview {
    @Previewable let productStage = 0
    @Previewable let productID = 0
    
    HanvestProductOfInvestmentTable(
        productStage: productStage,
        productID: productID
    )
    .padding(.horizontal, 20)
    
}
