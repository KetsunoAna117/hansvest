//
//  Module04NumberedLists.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

struct HanvestModule04NumberedLists: View {
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
    HanvestModule04NumberedLists(numberedLists: ["First", "Second", "Third"])
}
