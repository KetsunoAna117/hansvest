//
//  SectorModuleEvaluationEntity.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/11/24.
//

import Foundation

struct SectorModuleEvaluationEntity: HanvestModuleContent {
    var id: String
    
    var question: String
    var choices: [String]
    var correctAnswerIdx: Int
}
