//
//  MultipleChoice.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

struct HanvestMultipleChoiceView: View {
    // Constants
    let question: String
    let options: [String]
    
    var image: Image?
    var customSpacing: CGFloat?
    var onSelectAnswer: ((String) -> Void)
    
    @State private var selectedButtonID = ""
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: (customSpacing != nil) ? customSpacing : 24) {
                Text(question)
                    .font(.nunito(.title2))
                    .frame(maxWidth: .infinity)
                
                if let image = image{
                    image
                }
            }
            .multilineTextAlignment(.center)
            
            ForEach(options, id: \.self) { option in
                HanvestButtonDefault(
                    style: getButtonStyle(id: option),
                    title: option,
                    action: {
                        self.selectedButtonID = option
                        onSelectAnswer(option)
                    }
                )
            }

        }
        .accessibilityElement(children: .contain)
        .accessibilityLabel("\(question) question page")
    }
    
    private func getButtonStyle(id: String) -> HanvestButtonStyle {
        if selectedButtonID == id {
            return .filled(isDisabled: false)
        }
        return .bordered(isDisabled: false)
    }

}

#Preview {
    @Previewable let question = RiskAndReturnModuleMultipleChoicePageContent.page01.question
    @Previewable let options = ["Swift", "Java", "Python"]
    
    HanvestMultipleChoiceView(
        question: question,
        options: options,
        onSelectAnswer: {_ in }
    )
    .padding(.horizontal, 20)
}
