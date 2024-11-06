//
//  HanvestLoadedUserDataViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import Foundation

class HanvestLoadedUserDataViewModel: ObservableObject {
    @Inject var getUserData: GetUserData
    
    @Published var isHighlightEverShown: Bool
    @Published var userData: UserDataEntity?
    
    init() {
        isHighlightEverShown = UserDefaults.standard.bool(forKey: "HighlightEverShown")
    }
    
    func setup(){
        if let user = getUserData.execute() {
            userData = user
            
            // Debug user transaction
            if let gotoInvestment = user.userInvestmentTransaction.filter({ investment in
                investment.stockIDName == "GOTO"
            }).first {
                print("Total Invested: \(gotoInvestment.totalInvested)")
                print("Total Lot Purchased: \(gotoInvestment.totalInvested)")
                for transaction in gotoInvestment.stockTransaction {
                    print("Transaction time: \(transaction.time)")
                    print("Transaction price: \(transaction.priceAtPurchase)")
                    print("Transaction lot: \(transaction.stockLotQuantity)")
                    print()
                }
            }
        }
        
    }
    
    func toggleHighlightEverShown() {
        UserDefaults.standard.set(true, forKey: "HighlightEverShown")
    }
    
}
