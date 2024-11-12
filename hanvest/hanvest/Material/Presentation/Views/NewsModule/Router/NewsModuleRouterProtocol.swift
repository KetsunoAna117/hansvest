//
//  Module06RouterProtocol.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 27/10/24.
//

protocol NewsModuleRouterProtocol {
    var content: [NewsModuleContentView] { get set }
    var overlay: NewsModuleOverlay? { get set }
    var progress: Int { get set }
    
    func push(_ content: NewsModuleContentView)
    func pop()
    func popToRoot()
    
    func displayOverlay(_ overlay: NewsModuleOverlay)
    func dismissOverlay()
    
    func addProgress()
}
