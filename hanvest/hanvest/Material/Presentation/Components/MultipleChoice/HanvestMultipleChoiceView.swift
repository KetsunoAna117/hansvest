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
    var correctAnswer: String?
    var wrongAnswer: String?
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
            
            ForEach(Array(options.enumerated()), id: \.element) { index, option in
                VStack(spacing: 0) {
                    HanvestButtonMultipleChoiceBehavior(
                        isChecked: determineButtonStyle(option: option),
                        selectedButtonID: $selectedButtonID,
                        id: "Item: \(index)",
                        title: option,
                        action: {
                            buttonAction(option: option)
                        }
                    )
                }
                .font(.nunito(.body))
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
            }
        }
        .accessibilityElement(children: .contain)
        .accessibilityLabel("\(question) question page")
    }
    
    private func buttonAction(option: String) {
        if correctAnswer == nil {
            onSelectAnswer(option)
        }
    }
    
    private func determineButtonStyle(option: String) -> HanvestButtonMultipleChoiceIsChecked {
        switch option {
            case correctAnswer:
                return .isChecked(checkedCondition: true)
            case wrongAnswer:
                return .isChecked(checkedCondition: false)
            default:
                if correctAnswer != nil {
                    return .isNotChecked(checkedCondition: false)
                } else {
                    return .isNotChecked(checkedCondition: true)
                }
        }
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
