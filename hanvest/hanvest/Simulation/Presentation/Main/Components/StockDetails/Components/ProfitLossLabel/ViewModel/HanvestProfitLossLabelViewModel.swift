//
//  HanvestProfitLossLabelViewModel.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 11/10/24.
//

import SwiftUI

class HanvestProfitLossLabelViewModel: ObservableObject{
    @Published var percentageValue: Double = 0
    @Published var deficit: Double = 0
    
    func calculatePercentageValue(_ initialValue: Int, _ currentValue: Int) {
        deficit = Double(currentValue - initialValue)
        
        if initialValue != 0 {
            percentageValue = abs((deficit / Double(initialValue)) * 100)
        } else {
            percentageValue = 0
        }
    }
    
    func determineLabelState(_ initialValue: Int, _ currentValue: Int) -> HanvestProfitLossLabelDefaultState{
        if currentValue > initialValue {
            return .Profit
        } else if currentValue < initialValue {
            return .Loss
        } else {
            return .NoChange
        }
    }
}
