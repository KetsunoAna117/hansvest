//
//  Module05RouterProtocol.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 24/10/24.
//

protocol FundamentalModuleRouterProtocol {
    var content: [FundamentalModuleContentView] { get set }
    var overlay: FundamentalModuleOverlay? { get set }
    var progress: Int { get set }
    
    func push(_ content: FundamentalModuleContentView)
    func pop()
    func popToRoot()
    
    func displayOverlay(_ overlay: FundamentalModuleOverlay)
    func dismissOverlay()
    
    func addProgress()
}
