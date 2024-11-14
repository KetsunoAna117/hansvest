//
//  ReusableModuleEvaluationEntity.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/11/24.
//

import Foundation

struct ReusableModuleEvaluationEntity: HanvestModuleContent {
    var id: String
    
    var question: String
    var choices: [String]
    var correctAnswerIdx: Int
}
