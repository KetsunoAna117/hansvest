//
//  SectorModuleRouterProtocol.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/11/24.
//

import Foundation

protocol SectorModuleRouterProtocol {
    var content: [SectorModuleScreenType] { get set }
    var progress: Int { get set }
    
    func push(_ content: SectorModuleScreenType)
    func pop()
}
