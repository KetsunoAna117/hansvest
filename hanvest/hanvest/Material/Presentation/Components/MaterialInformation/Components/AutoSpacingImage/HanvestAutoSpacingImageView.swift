//
//  HanvestGroupedImageView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

struct HanvestAutoSpacingImageView: View {
    // Constant
    let images: [Image]
    
    var body: some View {
        HStack(spacing: 0) {
            if images.count == 1 {
                images.first
            } else {
                ForEach(0..<images.count, id: \.self) { index in
                    images[index]
                        .resizable()
                        .scaledToFit()
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    @Previewable let image = Image("IDX-logo")
    HanvestAutoSpacingImageView(images: [image, image, image])
}
