//
//  hanvestNewsSimulationViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 27/10/24.
//

import Foundation

class HanvestNewsSimulationViewModel: ObservableObject {
    @Published var newsList: [SimulationNewsEntity]
    
    init(){
        newsList = []
    }
    
    func setup() {
        
    }
}
