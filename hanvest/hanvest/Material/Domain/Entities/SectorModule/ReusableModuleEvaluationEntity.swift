//
//  ReusableModuleEvaluationEntity.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/11/24.
//

struct ReusableModuleEvaluationEntity: HanvestModuleContent {
    var id: String
    
    var question: String
    var imageName: String?
    var choices: [String]
    var correctAnswerIdx: Int
}
