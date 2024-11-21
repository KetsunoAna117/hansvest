//
//  HanvestModule03ProductOfInvestmentChart.swift
//  hanvest
//
//  Created by Bryan Vernanda on 17/10/24.
//

import SwiftUI
import Charts

struct RiskAndReturnModuleProductOfInvestmentChart: View {
    @ObservedObject var viewmodel: HanvestProductPriceChartViewModel
    let symbolCategoryKeyPath: KeyPath<ProductPriceEntity, String>
    
    var displayStep: Int = 15
    
    var body: some View {
        HanvestCardBackground {
            VStack {
                Chart {
                    ForEach(viewmodel.prices, id: \.id) { price in
                        LineMark(
                            x: .value("Days", daysSinceStart(for: price.time)),
                            y: .value("Price", price.price)
                        )
                        .symbol(symbol: {
                            Circle()
                                .frame(width: 8, height: 8)
                                .foregroundStyle(.seagull500)
                        })
                        .foregroundStyle(.seagull500)
                    }
                }
                .chartXScale(domain: 0...daysSinceStart(for: viewmodel.prices.last?.time ?? Date()))
                .chartXAxis {
                    AxisMarks(values: xAxisValues()) { value in
                        if let dayValue = value.as(Int.self) {
                            AxisValueLabel("\(dayValue)")
                                .offset(x: (30))
                        }
                    }
                }
                .chartYScale(domain: viewmodel.lowerBound...viewmodel.upperBound)
                .chartYAxis {
                    AxisMarks(values: viewmodel.yAxisValues) { value in
                        AxisGridLine()
                        AxisTick()
                        AxisValueLabel(formatLargeNumber(value.as(Double.self) ?? 0)) // Format large numbers
                    }
                }
                .chartXAxisLabel("Days")
                .chartYAxisLabel("Price")
                .frame(height: 250)
            }
        }
    }
    
    private func daysSinceStart(for date: Date) -> Int {
        let calendar = Calendar.current
        let startDate = viewmodel.prices.first?.time ?? Date()
        let dayDifference = calendar.dateComponents([.day], from: startDate, to: date).day ?? 0
        return dayDifference
    }
    
    private func xAxisValues() -> [Int] {
        guard let endDate = viewmodel.prices.last?.time else {
            return []
        }

        let daysDifference = daysSinceStart(for: endDate)
        
        return stride(from: 0, through: daysDifference, by: displayStep).map { $0 }
    }
    
    private func formatLargeNumber(_ value: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 3

        if value >= 1_000_000 {
            let formattedValue = value / 1_000_000
            return "\(numberFormatter.string(from: NSNumber(value: formattedValue))!)M"
        } else if value >= 1_000 {
            let formattedValue = value / 1_000
            return "\(numberFormatter.string(from: NSNumber(value: formattedValue))!)K"
        } else {
            return "\(numberFormatter.string(from: NSNumber(value: value))!)"
        }
    }
}

#Preview {
    @Previewable @State var productPrices = ProductOfInvestmentEntity.getMockData()[0][0].productPrices
    
    RiskAndReturnModuleProductOfInvestmentChart(
        viewmodel: HanvestProductPriceChartViewModel(prices: productPrices),
        symbolCategoryKeyPath: \.name,
        displayStep: 15
    )
    .padding(.horizontal, 20)
}

