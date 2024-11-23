//
//  SectorMultipleChoiceContainer.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/11/24.
//

import SwiftUI

struct ReusableMultipleChoiceContainer: View {
    var data: ReusableModuleEvaluationEntity
    var onContinueButtonAction: () -> Void
    
    @State private var selectedButtonID: String = ""
    @State private var userPressSubmitButton: Bool = false
    
    var body: some View {
        VStack(spacing: (!userPressSubmitButton) ? 48 : 0) {
            ScrollView {
                VStack(spacing: 24) {
                    Text(data.question)
                        .font(.nunito(.title2, .regular))
                        .multilineTextAlignment(.center)
                    
                    if let imageName = data.imageName {
                        Image(imageName)
                    }
                    
                    ForEach(data.choices, id: \.self) { choice in
                        HanvestButtonDefault(
                            style: getButtonStyle(id: choice),
                            title: choice,
                            image: getButtonImage(id: choice),
                            action: {
                                self.selectedButtonID = choice
                            }
                        )
                        .disabled(userPressSubmitButton)
                    }
                }
                .padding(.horizontal, 20)
                .frame(maxHeight: .infinity, alignment: .top)
            }
            .scrollBounceBehavior(.basedOnSize, axes: [.vertical])
            
            if userPressSubmitButton {
                if validateChoice() == true && selectedButtonID.isEmpty == false {
                    HanvestConfirmationFeedbackView(
                        state: .correct,
                        action: {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                resetData()
                                onContinueButtonAction()
                            }
                        }
                    )
                }
                else if validateChoice() == false && selectedButtonID.isEmpty == false {
                    HanvestConfirmationFeedbackView(
                        state: .incorrect,
                        action: {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                resetData()
                                onContinueButtonAction()
                            }
                        }
                    )
                }
            }
            else {
                HanvestButtonDefault(
                    style: .filled(
                        isDisabled: selectedButtonID.isEmpty
                    ),
                    title: "Continue",
                    action: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            self.userPressSubmitButton = true
                        }
                    }
                )
                .padding(.horizontal, 20)
                .padding(.bottom, 54)
            }
            
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
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
    
    func getButtonImage(id: String) -> Image? {
        let buttonStyle = getButtonStyle(id: id)
        
        switch buttonStyle {
        case .filledCorrect(isDisabled: false):
            return Image(systemName: "checkmark")
        case .filledIncorrect(isDisabled: false):
            return Image(systemName: "xmark")
        default:
            return nil
        }
    }
    
    func validateChoice() -> Bool {
        let idx = data.correctAnswerIdx - 1
        guard idx >= 0 else {
            debugPrint("ERROR: Wrong Choice Index")
            return false
        }
        return selectedButtonID == data.choices[idx]
    }
    
    func resetData(){
        selectedButtonID = ""
        userPressSubmitButton = false
    }
}

#Preview {
    ReusableMultipleChoiceContainer(
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
