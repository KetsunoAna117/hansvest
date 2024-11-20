//
//  ReusableModuleRouter.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 14/11/24.
//

import Foundation
import SwiftUI

class ReusableModuleRouter: ObservableObject, ReusableModuleRouterProtocol {
    @Published var content: [ReusableModuleScreenType] = []
    @Published var progress: Int = 0
    
    func push(_ content: ReusableModuleScreenType) {
        self.content.append(content)
    }
    
    func pop() {
        self.content.removeLast()
    }
    
    func addProgress() {
        progress += 1
    }
    
    @ViewBuilder
    func build(_ content: ReusableModuleScreenType) -> some View {
        switch content {
        case .information(let data, let action):
            VStack {
                ReusableInformationContainer(
                    data: data,
                    onContinueButtonAction: action
                )
            }
        case .multipleChoice(let data, let action):
            VStack {
                ReusableMultipleChoiceContainer(
                    data: data,
                    onContinueButtonAction: action
                )
            }
        }
    }
    
    
}
