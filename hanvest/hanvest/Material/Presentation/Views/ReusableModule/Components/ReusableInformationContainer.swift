//
//  ReusableInformationContainer.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/11/24.
//

import SwiftUI

struct ReusableInformationContainer: View {
    var data: ReusableModuleInformationEntity
    var buttonLabel: String = "Continue"
    var onContinueButtonAction: () -> Void
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 40) {
                    Text(data.title)
                        .font(.nunito(.title2, .bold))
                    
                    if let image = data.image {
                        image.resizable().frame(width: 270, height: 212)
                    }
                    
                    Text(data.content)
                        .font(.nunito(.body))
                        .multilineTextAlignment(.leading)
                }
            }
            .padding(.horizontal, 16)
            
            HanvestButtonDefault(
                title: buttonLabel,
                action: {
                    onContinueButtonAction()
                }
            )
            .padding(.top, 16)
            .padding(.bottom, 54)
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    ReusableInformationContainer(
        data: .init(
            id: "1",
            title: "What's a Stock Sector",
            image: Image(._12StockSector),
            content: """
                The Indonesia Stock Exchange (IDX) offers a sector-based classification system, which organizes companies into industry sectors to facilitate investment analysis. These sectors include financials, consumer goods, infrastructure, energy, healthcare, and more, each further divided into subsectors. The system allows investors to analyze trends within specific sectors and compare companies against their industry peers

                Each sector has its own index that tracks the performance of companies within that sector, providing insight into sector-specific trends. For instance, the financial sector index may respond differently to economic events compared to the consumer goods index, allowing for targeted sector investments. Platforms like TradingView and Indonesia Investments provide real-time data and sectoral performance analysis to support investors in making informed decisions on the IDX.
            """
        ),
        onContinueButtonAction: {
            debugPrint("Continue button tapped")
        }
    )
}
