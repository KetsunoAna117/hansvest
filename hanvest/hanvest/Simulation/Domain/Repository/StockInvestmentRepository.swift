//
//  StockTransactionRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 29/10/24.
//

import Foundation

protocol StockInvestmentRepository {
    func fetch() -> [StockInvestmentSchema]
    func fetchBy(investmentID: String) -> StockInvestmentSchema?
    func fetchBy(userID: String) -> [StockInvestmentSchema]
    func fetchBy(userID: String, stockIDName: String) -> StockInvestmentSchema?
    func save(investment: StockInvestmentSchema) throws
    func add(investmentID: String, totalInvested: Int, lotPurchased: Int) throws
    func substract(investmentID: String, totalInvested: Int, lotPurchased: Int) throws
}
