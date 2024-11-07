//
//  LocalNewsSimulationViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 17/10/24.
//

import Foundation

class LocalNewsSimulationViewModel: HanvestNewsSimulationViewModel {
    @Inject var getStockNewsData: GetStockNewsData
    
    override func setup() {
        newsList = getStockNewsData.execute()
    }
}
