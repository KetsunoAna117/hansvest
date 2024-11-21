//
//  SectorModuleInformationEntity.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/11/24.
//

struct ReusableModuleInformationEntity: HanvestModuleContent {
    var id: String
    
    var title: String
    var imageNames: [String]?
    var content: String
    var pointContent: ReusableModulePointEntity?
}
