//
//  SectorModuleScreenType.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/11/24.
//

import Foundation

enum ReusableModuleScreenType {
    case information(data: ReusableModuleInformationEntity, onContinueAction: () -> Void)
    case multipleChoice(data: ReusableModuleEvaluationEntity, onContinueAction: () -> Void)
}
