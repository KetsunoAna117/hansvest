//
//  Module02TextImageView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

struct LiabilitiesVsAssetModuleTextImageView: View {
    // Constants
    let title: String
    let image: Image
    let customSpacing: CGFloat
    
    var body: some View {
        VStack(spacing: customSpacing) {
            Text(title)
                .font(.nunito(.title2))
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
            
            image
                .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    LiabilitiesVsAssetModuleTextImageView(
        title: "Now you go the store to get one for yourself",
        image: Image("iphone-pic-01"),
        customSpacing: 78
    )
}
