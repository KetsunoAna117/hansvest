//
//  RiskAndReturnModuleMultipleChoiceView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 12/11/24.
//

import SwiftUI

struct RiskAndReturnModuleMultipleChoiceView: View {
    // Constants
    let question: String
    let options: [String]
    
    var onSelectAnswer: ((String) -> Void)
    
    @State private var moneyBalance: Int = 10000000
    @State private var selectedButtonID = ""
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 0) {
                Text(question)
                    .font(.nunito(.title2))
                    .frame(maxWidth: .infinity)
                
                Text("Balance: Rp. \(moneyBalance)")
                    .font(.nunito(.callout))
                    .frame(maxWidth: .infinity)

            }
            .multilineTextAlignment(.center)
            
            ForEach(Array(options.enumerated()), id: \.element) { index, option in
                VStack(spacing: 0) {
                    HanvestButtonMultipleChoiceBehavior(
                        selectedButtonID: $selectedButtonID,
                        id: "Item: \(index)",
                        title: option,
                        action: {
                            removeMoneyBalance()
                            onSelectAnswer(option)
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
    
    private func removeMoneyBalance() {
        if moneyBalance != 0 {
            moneyBalance = 0
        }
    }
    
}

#Preview {
    @Previewable let question = RiskAndReturnModuleMultipleChoicePageContent.page01.question
    @Previewable let options = ["Swift", "Java", "Python"]
    
    RiskAndReturnModuleMultipleChoiceView(
        question: question,
        options: options,
        onSelectAnswer: {_ in }
    )
    .padding(.horizontal, 20)
}
