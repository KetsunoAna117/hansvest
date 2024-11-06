//
//  HanvestNumberStepperViewModel.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 09/10/24.
//

import Foundation

class HanvestNumberStepperViewModel: ObservableObject {
    func increment(_ value: inout Int, _ raise: Int) {
        value += raise
    }

    func decrement(_ value: inout Int, _ raise: Int) {
        value -= raise
    }
}

