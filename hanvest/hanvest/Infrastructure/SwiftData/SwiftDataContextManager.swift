//
//  SwiftDataContextManager.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 20/10/24.
//

import Foundation
import SwiftData

public class SwiftDataContextManager {
    public static var shared = SwiftDataContextManager()
    var container: ModelContainer?
    var context: ModelContext?
    
    init() {
        do {
            container = try ModelContainer(
                for: setupSchema()
            )
            
            if let container {
                context = ModelContext(container)
                prepopulateUserData()
                prepopulateSystemData()
            }
        } catch {
            debugPrint("Error initializing database container:", error)
        }
    }
    
    private func setupSchema() -> Schema {
        return Schema([
            UserSchema.self,
            StockTransactionSchema.self,
            SimulationNewsSchema.self,
            ProductPriceSchema.self,
            SimulationStockSchema.self,
        ])
    }
}

// CRUD Method
private extension SwiftDataContextManager {
    // SAVE
    func saveUserData(userDataSchema: UserSchema) {
        if let context{
            context.insert(userDataSchema)
        }
    }
    
    func saveStockTransactionData(stockTransaction: StockTransactionSchema){
        if let context {
            context.insert(stockTransaction)
        }
    }
    
    func saveNewsData(news: SimulationNewsSchema) {
        if let context {
            context.insert(news)
        }
    }
    
    func saveProductPriceData(productPrice: ProductPriceSchema) {
        if let context {
            context.insert(productPrice)
        }
    }
    
    func saveSimulationStockData(stockSimulation: SimulationStockSchema) {
        if let context {
            context.insert(stockSimulation)
        }
    }
    
    // FETCH
    func fetchUserSchema() -> UserSchema? {
        if let context {
            do {
                let descriptor = FetchDescriptor<UserSchema>()
                let userSchema = try context.fetch(descriptor)
                return userSchema.first
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
        return nil
    }
    
    func fetchTransactionSchema() -> [StockTransactionSchema] {
        if let context {
            do {
                let descriptor = FetchDescriptor<StockTransactionSchema>()
                let result = try context.fetch(descriptor)
                return result
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
        return []
    }
    
    func fetchNewsSchema() -> [SimulationNewsSchema] {
        if let context {
            do {
                let descriptor = FetchDescriptor<SimulationNewsSchema>()
                let result = try context.fetch(descriptor)
                return result
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
        return []
    }
    
    func fetchProductPriceSchema() -> [ProductPriceSchema] {
        if let context {
            do {
                let descriptor = FetchDescriptor<ProductPriceSchema>()
                let result = try context.fetch(descriptor)
                return result
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
        return []
    }
    
    func fetchSimulationStockSchema() -> [SimulationStockSchema] {
        if let context {
            do {
                let descriptor = FetchDescriptor<SimulationStockSchema>()
                let result = try context.fetch(descriptor)
                return result
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
        return []
    }
}

// Prepopulate Data
private extension SwiftDataContextManager {
    func prepopulateUserData(){
        let userSchemaData = fetchUserSchema()
        if userSchemaData == nil {
            let result = getMockUserSchemaData()
            saveUserData(userDataSchema: result)
        }
    }
    
    func prepopulateSystemData() {
        let transactionSchemaData = fetchTransactionSchema()
        let newsSchemaData = fetchNewsSchema()
        let productPriceSchemaData = fetchProductPriceSchema()
        let simulationStockSchemaData = fetchSimulationStockSchema()
        
        if transactionSchemaData.count <= 0 {
            let result = getMockTransactionSchemaData()
            for data in result {
                saveStockTransactionData(stockTransaction: data)
            }
        }
        
        if newsSchemaData.count <= 0 {
            let result = getMockNewsSchemaData()
            for data in result {
                saveNewsData(news: data)
            }
        }
        
        if productPriceSchemaData.count <= 0 {
            let result = getMockProductPriceSchemaData()
            for data in result {
                saveProductPriceData(productPrice: data)
            }
        }
        
        if simulationStockSchemaData.count <= 0 {
            let result = getMockSimulationStockSchemaData()
            for data in result {
                saveSimulationStockData(stockSimulation: data)
            }
        }
    }
    
    func getMockUserSchemaData() -> UserSchema {
        return  UserSchema(
            userId: UUID().uuidString,
            userName: "Bryon",
            userBalance: 100000,
            userRiskProfile: .conservative,
            userInvestmentTransactionID: [
                "transaction-01",
                "transaction-02",
                "transaction-03"
            ],
            transactionQueueID: [
                "transaction-04"
            ],
            moduleCompletionIDList: [.module01, .module02, .module03, .module04]
        )
    }
    
    func getMockTransactionSchemaData() -> [StockTransactionSchema] {
        return [
            StockTransactionSchema(
                transactionID: "transaction-01",
                stockIDName: "BBRI",
                priceAtPurchase: 5000,
                stockLotQuantity: 1,
                time: Date.now.addingTimeInterval(-40 * 60)
            ),
            StockTransactionSchema(
                transactionID: "transaction-02",
                stockIDName: "BBRI",
                priceAtPurchase: 5100,
                stockLotQuantity: 2,
                time: Date.now.addingTimeInterval(-30 * 60)
            ),
            StockTransactionSchema(
                transactionID: "transaction-03",
                stockIDName: "BBCA",
                priceAtPurchase: 7000,
                stockLotQuantity: 1,
                time: Date.now.addingTimeInterval(-20 * 60)
            ),
            StockTransactionSchema(
                transactionID: "transaction-04",
                stockIDName: "GOTO",
                priceAtPurchase: 50,
                stockLotQuantity: 10,
                time: Date.now.addingTimeInterval(-10 * 60)
            )
        ]
    }
    
    func getMockNewsSchemaData() -> [SimulationNewsSchema] {
        return [
            .init(
                newsID: UUID().uuidString,
                stockIDName: "GOTO",
                newsTitle: "GOTO gets billions in funding",
                newsReleasedTime: Date(timeInterval: -10, since: Date.now),
                newsContent:
                """
                In a recent report released today, Chinese tech giant Alibaba is said to have injected billions of rupiah into Gojek Tokopedia (GOTO). This investment is seen as part of Alibaba’s strategy to expand its business reach in Southeast Asia, particularly in Indonesia.
                
                Alibaba's move is viewed as an effort to strengthen GOTO’s ecosystem, which spans e-commerce, on-demand services, including transportation, food delivery, and online shopping platforms that are increasingly dominating the domestic market.
                
                The Chinese company is no stranger to Southeast Asia, having previously made significant investments in Lazada. With this new capital infusion, GOTO is expected to accelerate its growth and better compete against other global tech giants.
                
                Neither GOTO nor Alibaba has provided an official comment on the report, but analysts predict that this investment will further solidify GOTO’s position as a key player in Indonesia’s digital economy.
                
                """,
                stockFluksPercentage: 10,
                hasTriggered: true
            ),
            .init(
                newsID: UUID().uuidString,
                stockIDName: "BBRI",
                newsTitle: "BBRI got positive revenue",
                newsReleasedTime: Date(timeInterval: -3 * 60 * 60 * 24, since: Date.now),
                newsContent:
                """
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus fermentum nunc ac purus rutrum mollis. Proin in luctus velit. Morbi mollis mollis enim quis blandit. Donec sollicitudin nunc dui. Integer rhoncus lacus nec urna sagittis, eu facilisis lacus condimentum. Duis massa ex, volutpat ac ullamcorper quis, euismod id ex. Sed sit amet condimentum metus. Duis lobortis arcu ac justo dapibus viverra. Vestibulum sagittis ullamcorper metus, eu malesuada ligula laoreet vulputate. Nam convallis gravida auctor. Sed blandit arcu id luctus ullamcorper. Suspendisse vel feugiat dui. Aenean nec massa velit. Vestibulum ut ullamcorper purus. Fusce fermentum ipsum vitae quam tincidunt, a tincidunt dui ultricies.
                
                """,
                stockFluksPercentage: -5,
                hasTriggered: true
            )
        ]
    }
    
    func getMockProductPriceSchemaData() -> [ProductPriceSchema] {
        return [
            .init(id: "BBRI-price-1", name: "BBRI", price: 3000, time: HanvestDateFormatter.stringToDate("2024-10-11 15:00:00")),
            .init(id: "BBRI-price-2", name: "BBRI", price: 4000, time: HanvestDateFormatter.stringToDate("2024-10-11 15:30:00")),
            .init(id: "BBRI-price-3", name: "BBRI", price: 5000, time: HanvestDateFormatter.stringToDate("2024-10-11 16:00:00")),
            .init(id: "BBRI-price-4", name: "BBRI", price: 6000, time: HanvestDateFormatter.stringToDate("2024-10-11 16:30:00")),
            .init(id: "BBRI-price-5", name: "BBRI", price: 4000, time: HanvestDateFormatter.stringToDate("2024-10-11 17:00:00")),
            .init(id: "BBRI-price-6", name: "BBRI", price: 2000, time: HanvestDateFormatter.stringToDate("2024-10-11 17:30:00")),
            .init(id: "BBRI-price-7", name: "BBRI", price: 3000, time: HanvestDateFormatter.stringToDate("2024-10-11 18:00:00")),
            .init(id: "BBRI-price-8", name: "BBRI", price: 5000, time: HanvestDateFormatter.stringToDate("2024-10-11 18:30:00")),
            .init(id: "BBRI-price-9", name: "BBRI", price: 5000, time: HanvestDateFormatter.stringToDate("2024-10-11 19:00:00")),
            .init(id: "BBRI-price-10", name: "BBRI", price: 6000, time: HanvestDateFormatter.stringToDate("2024-10-11 19:30:00")),
            .init(id: "BBRI-price-11", name: "BBRI", price: 4000, time: HanvestDateFormatter.stringToDate("2024-10-11 20:00:00")),
            .init(id: "BBRI-price-12", name: "BBRI", price: 7000, time: HanvestDateFormatter.stringToDate("2024-10-11 20:30:00")),
            .init(id: "BBRI-price-13", name: "BBRI", price: 7000, time: HanvestDateFormatter.stringToDate("2024-10-11 21:00:00")),
            .init(id: "BBRI-price-14", name: "BBRI", price: 7000, time: HanvestDateFormatter.stringToDate("2024-10-11 21:30:00")),
            .init(id: "BBRI-price-15", name: "BBRI", price: 7000, time: HanvestDateFormatter.stringToDate("2024-10-11 22:00:00")),
            .init(id: "BBCA-price-1", name: "BBCA", price: 5000, time: HanvestDateFormatter.stringToDate("2024-10-11 19:20:00")),
            .init(id: "BBCA-price-2", name: "BBCA", price: 6000, time: HanvestDateFormatter.stringToDate("2024-10-11 20:30:00")),
            .init(id: "BBCA-price-3", name: "BBCA", price: 4000, time: HanvestDateFormatter.stringToDate("2024-10-11 21:40:00")),
            .init(id: "BBCA-price-4", name: "BBCA", price: 4500, time: HanvestDateFormatter.stringToDate("2024-10-11 22:50:00")),
            .init(id: "GOTO-price-1", name: "GOTO", price: 50, time: HanvestDateFormatter.stringToDate("2024-10-11 20:20:00")),
            .init(id: "GOTO-price-2", name: "GOTO", price: 60, time: HanvestDateFormatter.stringToDate("2024-10-11 21:30:00")),
            .init(id: "GOTO-price-3", name: "GOTO", price: 65, time: HanvestDateFormatter.stringToDate("2024-10-11 22:40:00")),
            .init(id: "GOTO-price-4", name: "GOTO", price: 55, time: HanvestDateFormatter.stringToDate("2024-10-11 23:50:00"))
        ]
    }
    
    func getMockSimulationStockSchemaData() -> [SimulationStockSchema] {
        return [
            .init(
                stockIDName: "BBRI",
                stockName: "Pt. Bank Rakyat Indonesia Tbk.",
                stockImageName: "BBRI-logo",
                stockDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer rhoncus tellus nulla, ut blandit neque rutrum in. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sem lectus, semper a libero ut, congue sodales sem. Ut convallis volutpat ipsum quis maximus.",
                stockPriceID: [
                    "BBRI-price-1",
                    "BBRI-price-2",
                    "BBRI-price-3",
                    "BBRI-price-4",
                    "BBRI-price-5",
                    "BBRI-price-6",
                    "BBRI-price-7",
                    "BBRI-price-8",
                    "BBRI-price-9",
                    "BBRI-price-10",
                    "BBRI-price-11",
                    "BBRI-price-12",
                    "BBRI-price-13",
                    "BBRI-price-14",
                    "BBRI-price-15",
                ]
            ),
            .init(
                stockIDName: "BBCA",
                stockName: "Pt. Bank Central Asia Tbk.",
                stockImageName: "BBCA-logo",
                stockDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer rhoncus tellus nulla, ut blandit neque rutrum in. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sem lectus, semper a libero ut, congue sodales sem. Ut convallis volutpat ipsum quis maximus.",
                stockPriceID: [
                    "BBCA-price-1",
                    "BBCA-price-2",
                    "BBCA-price-3",
                    "BBCA-price-4",
                ]
            ),
            .init(
                stockIDName: "GOTO",
                stockName: "Pt. GOTO Tbk.",
                stockImageName: "GOTO-logo",
                stockDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer rhoncus tellus nulla, ut blandit neque rutrum in. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sem lectus, semper a libero ut, congue sodales sem. Ut convallis volutpat ipsum quis maximus.",
                stockPriceID: [
                    "GOTO-price-1",
                    "GOTO-price-2",
                    "GOTO-price-3",
                    "GOTO-price-4",
                ]
            )
        ]
    }

}
