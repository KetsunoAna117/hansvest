//
//  Module05RouterProtocol.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 24/10/24.
//

protocol Module05RouterProtocol {
    var content: [Module05ContentView] { get set }
    var overlay: Module05Overlay? { get set }
    var progress: Int { get set }
    
    func push(_ content: Module05ContentView)
    func pop()
    func popToRoot()
    
    func displayOverlay(_ overlay: Module05Overlay)
    func dismissOverlay()
    
    func addProgress()
}
