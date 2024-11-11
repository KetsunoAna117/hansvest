//
//  HanvestModuleDescription.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 14/10/24.
//

import SwiftUI

struct HanvestPopup: View {
    var title: String?
    var description: String
    var buttonSize: HanvestButtonSize = .medium
    var buttonStyle: HanvestButtonStyle = .filled(isDisabled: false)
    var iconPosition: HanvestButtonIconPosition = .hidden
    var buttonTitle: String = "Let's go"
    var buttonImage: Image?
    var action: (() -> Void)? = nil
    
    var body: some View {
        HanvestCardBackground {
            VStack(spacing: 16) {
                VStack {
                    if let title = title {
                        Text(title)
                            .font(.nunito(.title2, .bold))
                            .multilineTextAlignment(.center)
                    }
                    
                    Text(description)
                        .font(.nunito(.subhead))
                        .multilineTextAlignment(.center)
                }
                
                if let action = action {
                    HanvestButtonDefault(
                        size: buttonSize,
                        style: buttonStyle,
                        iconPosition: iconPosition,
                        title: buttonTitle,
                        image: buttonImage,
                        action: action
                    )
                }
            }
            .padding(4)
        }
    }
}

#Preview {
    HanvestPopup(
        title: "Basic Investment",
        description: "This module uses fun tree analogies to teach investing basics. Discover the importance of patience, care, and potential rewards.",
        action: {
            debugPrint("Let's go")
        }
    )
    .padding()
    
    HanvestPopup(
        title: "Dividen",
        description: "Dividen is a portion of a company's profits that is distributed to its shareholders. It's like a reward for investing in the company. When a company makes a profit, it can choose to keep some of it for future growth or share it with its investors. The amount of dividend a shareholder receives depends on how many shares they own and the company's dividend policy.",
        action: nil
    )
    .multilineTextAlignment(.center)
    .padding()
    
    HanvestPopup(
        title: nil,
        description: "You get new notification\nLets start your sixth module",
        action: nil
    )
    .multilineTextAlignment(.center)
    .padding()
}
