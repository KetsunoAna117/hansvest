//
//  HanvestBulletPointList.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

struct HanvestPointListView: View {
    // Constants
    let pointListContents: [String]
    
    var pointListStyle: HanvestPointListStyle = .bulleted
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(Array(pointListContents.enumerated()), id: \.offset) { index, content in
                HStack(alignment: .top) {
                    Text((pointListStyle == .bulleted) ? "•" : "\(index + 1).")
                    
                    Text(content)
                }
                .font(.nunito(.body))
            }
        }
    }
}

#Preview {
    @Previewable let pointListContents = [
        "Understanding assets (anything of value), liabilities (debts), income, and expenses is key to managing personal finances. Assets generate income streams, while liabilities represent financial obligations. A personal balance sheet helps individuals clearly monitor their financial position, showing the difference between what they own (assets) and what they owe (liabilities).",
        "Understanding assets (anything of value), liabilities (debts), income, and expenses is key to managing personal finances. Assets generate income streams, while liabilities represent financial obligations. A personal balance sheet helps individuals clearly monitor their financial position, showing the difference between what they own (assets) and what they owe (liabilities).",
        "Understanding assets (anything of value), liabilities (debts), income, and expenses is key to managing personal finances. Assets generate income streams, while liabilities represent financial obligations. A personal balance sheet helps individuals clearly monitor their financial position, showing the difference between what they own (assets) and what they owe (liabilities).",
        "Understanding assets (anything of value), liabilities (debts), income, and expenses is key to managing personal finances. Assets generate income streams, while liabilities represent financial obligations. A personal balance sheet helps individuals clearly monitor their financial position, showing the difference between what they own (assets) and what they owe (liabilities)."
    ]
    
    HanvestPointListView(
        pointListContents: pointListContents,
        pointListStyle: .bulleted
    )
}
