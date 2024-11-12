//
//  Module04NumberedLists.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

struct StockRegulatorModuleNumberedListsView: View {
    // Constants
    let numberedLists: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(Array(numberedLists.enumerated()), id: \.offset) { index, numberedList in
                HStack(alignment: .top) {
                    Text("\(index + 1).")
                    
                    Text(numberedList)
                }
                .font(.nunito(.body))
            }
        }
    }
}

#Preview {
    StockRegulatorModuleNumberedListsView(numberedLists: ["First", "Second", "Third"])
}
