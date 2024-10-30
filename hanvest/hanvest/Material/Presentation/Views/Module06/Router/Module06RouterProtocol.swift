//
//  Module06RouterProtocol.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 27/10/24.
//

protocol Module06RouterProtocol {
    var content: [Module06ContentView] { get set }
    var overlay: Module06Overlay? { get set }
    var progress: Int { get set }
    
    func push(_ content: Module06ContentView)
    func pop()
    func popToRoot()
    
    func displayOverlay(_ overlay: Module06Overlay)
    func dismissOverlay()
    
    func addProgress()
}
