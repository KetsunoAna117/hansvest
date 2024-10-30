//
//  StockInvestmentDataViewModels.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 14/10/24.
//

import Foundation
import SwiftUI

class StockInvestmentDataViewModels: ObservableObject {
    @Inject var getUserTransaction: GetUserInvestmentData
    
    @Published var profitLossLabel: Int
    @Published var profitLossPercentageLabel: Int
    
    @Published var userLotOwned: Int
    @Published var userStockInvestment: Int
    @Published var userTotalEquity: Int
    
    init(){
        profitLossLabel = 0
        profitLossPercentageLabel = 0
        userLotOwned = 0
        userStockInvestment = 0
        userTotalEquity = 0
    }
    
    func setup(
        userData: UserDataEntity,
        selectedStockIDName: String,
        stockPrice: Int
    ){
        setupTotalInvestment(selectedStockIDName: selectedStockIDName, userData: userData)
        userTotalEquity = stockPrice * userLotOwned * 100
    }
    
    func calculateProfitLoss(userInvestment: Binding<Int>, totalEquity: Binding<Int>) {
        profitLossLabel = userInvestment.wrappedValue - totalEquity.wrappedValue
        
    }

    private func setupTotalInvestment(selectedStockIDName: String, userData: UserDataEntity){
        setToZero()
        
        if let userInvestment = getUserTransaction.execute(stockIDName: selectedStockIDName, userData: userData) {
            userLotOwned = userInvestment.lotPurchased
            userStockInvestment = userInvestment.totalInvested
        }
        
    }
    
    func setToZero(){
        self.userLotOwned = 0
        self.userStockInvestment = 0
    }
    
}
