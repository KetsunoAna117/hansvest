//
//  HanvestBulletPointList.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

struct HanvestModule03BulletPointList: View {
    // Constants
    let bulletPoints: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(bulletPoints, id: \.self) { bulletPoint in
                HStack(alignment: .top) {
                    Text("•")
                        .font(.nunito(.callout, .bold))
                    
                    Text(bulletPoint)
                        .font(.nunito(.callout))
                }
            }
        }
    }
}

#Preview {
    @Previewable let bulletPoints = [
        "Understanding assets (anything of value), liabilities (debts), income, and expenses is key to managing personal finances. Assets generate income streams, while liabilities represent financial obligations. A personal balance sheet helps individuals clearly monitor their financial position, showing the difference between what they own (assets) and what they owe (liabilities).",
        "Understanding assets (anything of value), liabilities (debts), income, and expenses is key to managing personal finances. Assets generate income streams, while liabilities represent financial obligations. A personal balance sheet helps individuals clearly monitor their financial position, showing the difference between what they own (assets) and what they owe (liabilities).",
        "Understanding assets (anything of value), liabilities (debts), income, and expenses is key to managing personal finances. Assets generate income streams, while liabilities represent financial obligations. A personal balance sheet helps individuals clearly monitor their financial position, showing the difference between what they own (assets) and what they owe (liabilities).",
        "Understanding assets (anything of value), liabilities (debts), income, and expenses is key to managing personal finances. Assets generate income streams, while liabilities represent financial obligations. A personal balance sheet helps individuals clearly monitor their financial position, showing the difference between what they own (assets) and what they owe (liabilities)."
    ]
    
    HanvestModule03BulletPointList(
        bulletPoints: bulletPoints
    )
}
