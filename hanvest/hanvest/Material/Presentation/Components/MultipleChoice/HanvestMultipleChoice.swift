//
//  MultipleChoice.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

struct HanvestMultipleChoice: View {
    // Constants
    let question: String
    let options: [String]
    
    var image: Image?
    var correctAnswer: String?
    var wrongAnswer: String?
    var customSpacing: CGFloat?
    var onSelectAnswer: ((String) -> Void)
    
    @State private var moneyBalance: Int = 10000000
    @State private var selectedButtonID = ""
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: (customSpacing != nil) ? customSpacing : 0) {
                VStack(spacing: (customSpacing != nil) ? customSpacing : 24) {
                    
                    Text(question)
                        .font(.nunito(.title2))
                        .frame(maxWidth: .infinity)
                    
                    if let image = image{
                        image
                    }
                    
                }
                
                if checkIfQuestionIsModule03() {
                    Text("Balance: Rp. \(moneyBalance)")
                        .font(.nunito(.callout))
                        .frame(maxWidth: .infinity)
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
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                radioButtonAction(option: option)
                            }
                        }
                    )
                }
                .font(.nunito(.body))
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    private func radioButtonAction(option: String) {
        if checkIfQuestionIsModule03() {
            moneyBalance = 0
        }
        
        if correctAnswer == nil {
            onSelectAnswer(option)
        }
    }
    
    private func checkIfQuestionIsModule03() -> Bool {
        return (question.contains(Module03MultipleChoice.page01.question))
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
    @Previewable let question = Module03MultipleChoice.page01.question
    @Previewable let options = ["Swift", "Java", "Python"]
    
    HanvestMultipleChoice(
        question: question,
        options: options,
        onSelectAnswer: {_ in }
    )
    .padding(.horizontal, 20)
}
