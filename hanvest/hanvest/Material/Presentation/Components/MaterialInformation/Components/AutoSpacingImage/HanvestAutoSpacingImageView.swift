//
//  HanvestGroupedImageView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

struct HanvestAutoSpacingImageView: View {
    // Constant
    let imageNames: [String]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<imageNames.count, id: \.self) { index in
                Image(imageNames[index])
                    .resizable()
                    .scaledToFit()
            }
        }
        .frame(maxWidth: .infinity)
    }
    
}

#Preview {
    @Previewable let imageNames = "IDX-logo"
    HanvestAutoSpacingImageView(imageNames: [imageNames, imageNames, imageNames])
}
