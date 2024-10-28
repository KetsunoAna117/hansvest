//
//  HanvestSimulationNewsDetailsScreenView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 18/10/24.
//

import SwiftUI

struct Module06NewsDetailsView: View {
    let moduleRouter: any Module06RouterProtocol
    
    let news: SimulationNewsEntity
    
    var body: some View {
        VStack {
            HanvestNavigationBar(
                label: news.stockIDName,
                leadingIcon: Image(systemName: "chevron.left"),
                leadingAction: {
                    moduleRouter.pop()
                }
            )
            
            ScrollView {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text(news.newsTitle)
                            .font(.nunito(.title3, .bold))
                        Text(HanvestDateFormatter.getTimeDifferenceFrom(news.newsReleasedTime))
                            .font(.nunito(.footnote))
                            .foregroundStyle(Color.secondary)
                    }
                    
                    Text(news.newsContent)
                        .font(.nunito(.body))
                        .foregroundStyle(.primary)
                        .padding(.top, 16)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .safeAreaPadding(.vertical, 32)
            }
        }
    }
}
