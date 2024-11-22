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
    
    @State private var selectedButtonID: String = ""
    
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
                            style: option,
                            state: getRadioButtonState(id: option.colorDescription),
                            action: {
                                self.selectedButtonID = option.colorDescription
                                onSelectAnswer(option.colorDescription)
                            }
                        )
                    }
                }
            }
            
        }
        .frame(maxWidth: .infinity)
    }
    
    private func getRadioButtonState(id: String) -> HanvestButtonState {
        if selectedButtonID == id {
            return .pressed
        }
        return .unpressed
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
