//
//  Module02TextImageView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

struct LiabilitiesVsAssetModuleTextImageColorPickerView: View {
    // Constants
    let title: String
    let image: Image
    
    // Components
    var needColorPicker: Bool?
    var onSelectAnswer: ((String) -> Void)
    
    @State private var selectedButtonID = ""
    
    var body: some View {
        VStack(spacing: 24) {
            Text(title)
                .font(.nunito(.title2))
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
            
            image
                .frame(maxWidth: .infinity)
            
            if let _ = needColorPicker {
                HStack(spacing: 24) {
                    ForEach(LiabilitiesVsAssetModuleColorOptions.allCases, id: \.self) { option in
                        LiabilitiesVsAssetModuleColorPickerRadioButton(
                            radioButtonColor: option.colorOptions,
                            selectedButtonID: $selectedButtonID,
                            action: {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    onSelectAnswer(option.colorDescription)
                                }
                            }
                        )
                    }
                }
            }
            
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    LiabilitiesVsAssetModuleTextImageColorPickerView(
        title: "There’s a brand new iphone just released",
        image: Image("iphone-pic-01"),
        onSelectAnswer: {
            _ in
        }
    )
}
