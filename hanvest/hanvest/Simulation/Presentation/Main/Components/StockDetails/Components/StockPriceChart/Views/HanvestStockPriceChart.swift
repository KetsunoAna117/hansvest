//
//  HanvestStockPriceChart.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 14/10/24.
//

import SwiftUI
import Charts

struct HanvestStockPriceChart: View {
    @ObservedObject var viewmodel: HanvestProductPriceChartViewModel
    let symbolCategoryKeyPath: KeyPath<ProductPriceEntity, String> // Category to differentiate symbols
    
    var displayBy: Calendar.Component
    var displayStep: Int = 24
    
    var body: some View {
        HanvestCardBackground {
            VStack {
                Chart {
                    ForEach(viewmodel.prices, id: \.id) { price in
//                        AreaMark(
//                            x: .value("Time", price.time),
//                            y: .value("Price", price.stockPrice)
//                        )
//                        .foregroundStyle(Gradient(colors: [.seagull500.opacity(0.2), .clear])) // Gradient fill
//                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 5) // Shadow on area fill
                        
                        LineMark(
                            x: .value("Time", price.time),
                            y: .value("Price", price.price)
                        )
//                        .symbol(symbol: {
//                            Circle()
//                                .frame(width: 8, height: 8)
//                                .foregroundStyle(.seagull500)
//                        })
                        .foregroundStyle(.seagull500)
                    }
                }
//                .chartXAxis {
//                    AxisMarks(values: .stride(by: displayBy, count: displayStep)) { value in
//                        if value.as(Date.self) != nil {
//                            AxisGridLine()
//                            AxisTick()
//                            AxisValueLabel(format: .dateTime.hour(), centered: true) // Format to display hours and minutes
//                        }
//                    }
//                }
                .chartXAxis {
                    AxisMarks(values: .stride(by: displayBy, count: displayStep)) { value in
                        if value.as(Date.self) != nil {
                            AxisGridLine()
                            AxisTick()
                            AxisValueLabel(format: .dateTime.hour(), centered: true) // Format to display hours and minutes
                        }
                    }
                }
                // Set y-axis bounds using chartYScale
                .chartYScale(domain: viewmodel.lowerBound...viewmodel.upperBound)
                .chartYAxis {
                    AxisMarks(values: viewmodel.yAxisValues) {
                        value in
                        AxisGridLine()
                        AxisTick()
                        AxisValueLabel("\(value.as(Double.self)!, specifier: "%.0f")") // Display as integers
                    }
                }
                .chartXAxisLabel("Time (Hour)")
                .chartYAxisLabel("Price")
                .frame(height: 250)
//                .chartScrollableAxes(.horizontal)
//                .chartXVisibleDomain(length: simulationViewModel.timeRange / 2) // Adjust the length based on the time range
                
            }
            .padding()
        }
    }
}

//#Preview {
//    @Previewable @State var stockPrices = StockEntity.getMockData().first!.stockPrice
//    
//    HanvestStockPriceChart(
//        simulationViewModel: HanvestProductPriceChartViewModel(prices: stockPrices), symbolCategoryKeyPath: \.name, displayBy: .hour)
//    .padding(.horizontal, 20)
//}
