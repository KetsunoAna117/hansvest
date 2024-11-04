//
//  Module02TextImageView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

struct HanvestModule02TextImageColorPickerView: View {
    // Constants
    let title: String
    let image: Image
    let customSpacing: CGFloat
    
    // Components
    var needColorPicker: Bool?
    var onSelectAnswer: ((String) -> Void)
    
    @State private var selectedButtonID = ""
    
    var body: some View {
        VStack(spacing: 40) {
            
            HanvestModule02TextImageView(
                title: title,
                image: image,
                customSpacing: customSpacing
            )
            
            if let _ = needColorPicker {
                HStack(spacing: 24) {
                    ForEach(HanvestModule02ColorOptions.allCases, id: \.self) { option in
                        HanvestColorPickerRadioButton(
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
    HanvestModule02TextImageColorPickerView(
        title: "There’s a brand new iphone just released",
        image: Image("iphone-pic-01"),
        customSpacing: 65,
        onSelectAnswer: {
            _ in
        }
    )
}
