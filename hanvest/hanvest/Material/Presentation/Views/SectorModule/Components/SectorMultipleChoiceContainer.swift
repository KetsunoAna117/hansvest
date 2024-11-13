//
//  SectorMultipleChoiceContainer.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/11/24.
//

import SwiftUI

struct SectorMultipleChoiceContainer: View {
    var data: SectorModuleEvaluationEntity
    var onContinueButtonAction: () -> Void
    
    @State private var selectedButtonID: String = ""
    @State private var userPressSubmitButton: Bool = false
    
    var body: some View {
        VStack(spacing: 24) {
            Text(data.question)
                .font(.nunito(.title2, .regular))
                .multilineTextAlignment(.center)
            VStack(spacing: 24) {
                ForEach(data.choices, id: \.self) { choice in
                    HanvestButtonDefault(
                        style: getButtonStyle(id: choice),
                        title: choice,
                        action: {
                            self.selectedButtonID = choice
                        }
                    )
                    .disabled(userPressSubmitButton)
                }
            }
            .padding(.horizontal, 16)
            
            Spacer()
            
            if userPressSubmitButton {
                if validateChoice() == true && selectedButtonID.isEmpty == false {
                    HanvestConfirmationFeedbackView(
                        state: .correct,
                        action: {
                            onContinueButtonAction()
                        }
                    )
                }
                else if validateChoice() == false && selectedButtonID.isEmpty == false {
                    HanvestConfirmationFeedbackView(
                        state: .incorrect,
                        action: {
                            onContinueButtonAction()
                        }
                    )
                }
            }
            else {
                VStack {
                    HanvestButtonDefault(
                        style: .filled(
                            isDisabled: selectedButtonID.isEmpty
                        ),
                        title: "Continue",
                        action: {
                            self.userPressSubmitButton = true
                        }
                    )
                }
                .padding(.bottom, 54)
            }

        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
    
    func getButtonStyle(id: String) -> HanvestButtonStyle {
        let idx = data.correctAnswerIdx - 1
        guard idx >= 0 else {
            debugPrint("ERROR: Wrong Choice Index")
            return .bordered(isDisabled: false)
        }
        
        if userPressSubmitButton {
            // If the button is correct and is selected
            if id == data.choices[idx] {
                return .filledCorrect(isDisabled: false)
            }
            // If the button is incorrect and is selected
            else if id != data.choices[idx]
                && selectedButtonID == id {
                return .filledIncorrect(isDisabled: false)
            }
            return .bordered(isDisabled: false)
        }
        
        if selectedButtonID == id {
            return .filled(isDisabled: false)
        }
        return .bordered(isDisabled: false)
    }
    
    func validateChoice() -> Bool {
        let idx = data.correctAnswerIdx - 1
        guard idx >= 0 else {
            debugPrint("ERROR: Wrong Choice Index")
            return false
        }
        return selectedButtonID == data.choices[idx]
    }
}

#Preview {
    SectorMultipleChoiceContainer(
        data: .init(
            id: "1",
            question: "Which sector on the Indonesia Stock Exchange (IDX) includes banks and insurance firms, often sensitive to interest rate changes?",
            choices: [
                "Consumer Goods",
                "Financials",
                "Infrastructure",
                "Technology"
            ],
            correctAnswerIdx: 1
        ),
        onContinueButtonAction: {
            debugPrint("[!] Continue Button Pressed")
        }
    )
}
