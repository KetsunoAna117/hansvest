//
//  ReusableModuleEvaluationEntity.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/11/24.
//

import SwiftUI

struct ReusableModuleEvaluationEntity: HanvestModuleContent {
    var id: String
    
    var question: String
    var image: Image?
    var choices: [String]
    var correctAnswerIdx: Int
}
