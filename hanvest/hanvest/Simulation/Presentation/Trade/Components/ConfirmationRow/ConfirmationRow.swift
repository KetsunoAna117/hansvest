//
//  ConfirmationRow.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 16/10/24.
//

import SwiftUI

struct ConfirmationRow: View {
    var title: String
    var value: String
    
    var body: some View {
        HStack(spacing: 24) {
            Text(title)
                .font(.nunito(.body))
                .frame(width: 120, alignment: .topLeading)
            Text(value)
                .font(.nunito(.body))
                .accessibilityLabel(HanvestPriceFormatter.formatRupiahStringToSpelledOut(value))
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

#Preview {
    ConfirmationRow(title: "Price", value: "\(50)")
}
