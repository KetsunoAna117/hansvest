//
//  SectorModuleRouterProtocol.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/11/24.
//

import Foundation

protocol ReusableModuleRouterProtocol {
    var content: [ReusableModuleScreenType] { get set }
    var progress: Int { get set }
    
    func push(_ content: ReusableModuleScreenType)
    func pop()
    func addProgress()
}
