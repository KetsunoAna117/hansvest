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
        VStack(spacing: 48) {
            VStack(spacing: 24) {
                Text(data.title)
                    .font(.nunito(.title2, .bold))
                
                if let imageNames = data.imageNames {
                    HanvestAutoSpacingImageView(imageNames: imageNames)
                }
                
                ScrollView {
                    Text(data.content)
                        .font(.nunito(.body))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if let pointContent = data.pointContent {
                        HanvestPointListView(
                            pointListContents: pointContent.pointList,
                            pointListStyle: (pointContent.isBulleted) ? .bulleted : .numbered
                        )
                    }
                }
                .scrollBounceBehavior(.basedOnSize, axes: [.vertical])
            }
            .frame(maxHeight: .infinity, alignment: .top)
            
            HanvestButtonDefault(
                title: buttonLabel,
                action: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        onContinueButtonAction()
                    }
                }
            )
            .padding(.bottom, 54)

        }
        .padding(.horizontal, 20)
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

#Preview {
    ReusableInformationContainer(
        data: .init(
            id: "1",
            title: "What's a Stock Sector",
            imageNames: [
                "12-stock-sector-image"
            ],
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
