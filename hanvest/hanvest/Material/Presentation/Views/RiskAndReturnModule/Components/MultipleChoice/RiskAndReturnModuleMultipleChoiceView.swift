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
                    .accessibilityLabel(HanvestPriceFormatter.formatRupiahStringToSpelledOut("Balance: Rp \(moneyBalance)"))

            }
            .multilineTextAlignment(.center)
            
            ForEach(options, id: \.self) { option in
                HanvestButtonDefault(
                    style: getButtonStyle(id: option),
                    title: option,
                    action: {
                        self.selectedButtonID = option
                        removeMoneyBalance()
                        onSelectAnswer(option)
                    }
                )
            }
            
        }
        .frame(maxWidth: .infinity)
        .accessibilityElement(children: .contain)
        .accessibilityLabel("\(question) question page")
    }
    
    private func removeMoneyBalance() {
        if moneyBalance != 0 {
            moneyBalance = 0
        }
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
    
    RiskAndReturnModuleMultipleChoiceView(
        question: question,
        options: options,
        onSelectAnswer: {_ in }
    )
    .padding(.horizontal, 20)
}
