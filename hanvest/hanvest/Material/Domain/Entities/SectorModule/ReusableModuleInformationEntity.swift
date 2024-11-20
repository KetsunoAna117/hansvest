//
//  SectorModuleInformationEntity.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/11/24.
//

import SwiftUI

struct ReusableModuleInformationEntity: HanvestModuleContent {
    var id: String
    
    var title: String
    var images: [Image]?
    var content: String
    var pointContent: ReusableModulePointEntity?
}
