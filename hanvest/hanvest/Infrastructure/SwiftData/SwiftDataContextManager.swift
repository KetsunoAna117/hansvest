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
                intializeSwiftData()
            }
        } catch {
            debugPrint("Error initializing database container: ", error)
        }
    }
    
    private func intializeSwiftData() {
        #if DEBUG
        prepopulateUserData()
        #endif
        
        prepopulateSystemData()
    }
    
    private func setupSchema() -> Schema {
        return Schema([
            UserSchema.self,
            StockTransactionSchema.self,
            StockNewsSchema.self,
            ProductPriceSchema.self,
            StockSchema.self,
            StockInvestmentSchema.self,
            UserNotificationSchema.self
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
    
    func saveNewsData(news: StockNewsSchema) {
        if let context {
            context.insert(news)
        }
    }
    
    func saveProductPriceData(productPrice: ProductPriceSchema) {
        if let context {
            context.insert(productPrice)
        }
    }
    
    func saveSimulationStockData(stockSimulation: StockSchema) {
        if let context {
            context.insert(stockSimulation)
        }
    }
    
    func saveStockInvestmentData(investment: StockInvestmentSchema) {
        if let context {
            context.insert(investment)
        }
    }
    
    func saveNotificationSchema(notification: UserNotificationSchema) {
        if let context {
            context.insert(notification)
        }
    }
    
    // FETCH
    func fetchUserSchema() -> Int {
        if let context {
            do {
                let descriptor = FetchDescriptor<UserSchema>()
                let userSchema = try context.fetchCount(descriptor)
                return userSchema
            }
            catch {
                fatalError("Error Fetch Data: \(error)")
            }
        }
        return 0
    }
    
    func fetchTransactionSchema() -> Int {
        if let context {
            do {
                let descriptor = FetchDescriptor<StockTransactionSchema>()
                let result = try context.fetchCount(descriptor)
                return result
            }
            catch {
                fatalError("Error Fetch Data: \(error)")
            }
        }
        return 0
    }
    
    func fetchNewsSchema() -> Int {
        if let context {
            do {
                let descriptor = FetchDescriptor<StockNewsSchema>()
                let result = try context.fetchCount(descriptor)
                return result
            }
            catch {
                fatalError("Error Fetch Data: \(error)")
            }
        }
        return 0
    }
    
    func fetchProductPriceSchema() -> Int {
        if let context {
            do {
                let descriptor = FetchDescriptor<ProductPriceSchema>()
                let result = try context.fetchCount(descriptor)
                return result
            }
            catch {
                fatalError("Error Fetch Data: \(error)")
            }
        }
        return 0
    }
    
    func fetchSimulationStockSchema() -> Int {
        if let context {
            do {
                let descriptor = FetchDescriptor<StockSchema>()
                let result = try context.fetchCount(descriptor)
                return result
            }
            catch {
                fatalError("Error Fetch Data: \(error)")
            }
        }
        return 0
    }
    
    func fetchStockInvestmentSchema() -> Int {
        if let context {
            do {
                let descriptor = FetchDescriptor<StockInvestmentSchema>()
                let result = try context.fetchCount(descriptor)
                return result
            }
            catch {
                fatalError("Error Fetch Data: \(error)")
            }
        }
        return 0
    }
    
    func fetchNotificationSchema() -> Int {
        if let context {
            do {
                let descriptor = FetchDescriptor<UserNotificationSchema>()
                let result = try context.fetchCount(descriptor)
                return result
            }
            catch {
                fatalError("Error Fetch Data: \(error)")
            }
        }
        return 0
    }
}

// Prepopulate Data
private extension SwiftDataContextManager {
    func prepopulateUserData(){
        let userSchemaData = fetchUserSchema()
        if userSchemaData <= 0 {
            let result = getMockUserSchemaData()
            saveUserData(userDataSchema: result)
        }
        
        let transactionSchemaData = fetchTransactionSchema()
        if transactionSchemaData <= 0 {
            let result = getMockTransactionSchemaData()
            for data in result {
                saveStockTransactionData(stockTransaction: data)
            }
        }
        
        let userInvestmentData = fetchStockInvestmentSchema()
        if userInvestmentData <= 0 {
            let result = getMockInvestmentData()
            for data in result {
                saveStockInvestmentData(investment: data)
            }
        }
        
        let userNotificationData = fetchNotificationSchema()
        if userNotificationData <= 0 {
            let result = getUserNotificationData()
            for data in result {
                saveNotificationSchema(notification: data)
            }
        }
    }
    
    func prepopulateSystemData() {
        let newsSchemaData = fetchNewsSchema()
        let productPriceSchemaData = fetchProductPriceSchema()
        let simulationStockSchemaData = fetchSimulationStockSchema()
        
        if newsSchemaData <= 0 {
            let result = getMockNewsSchemaData()
            for data in result {
                saveNewsData(news: data)
            }
        }
        
        if productPriceSchemaData <= 0 {
            let result = getMockProductPriceSchemaData()
            for data in result {
                saveProductPriceData(productPrice: data)
            }
        }
        
        if simulationStockSchemaData <= 0 {
            let result = getMockSimulationStockSchemaData()
            for data in result {
                saveSimulationStockData(stockSimulation: data)
            }
        }
    }
    
    func getMockUserSchemaData() -> UserSchema {
        return UserSchema(
            userId: "user-01",
            userName: "Bryon",
            userBalance: 100000000,
            userRiskProfile: .conservative,
            moduleCompletionIDList: [.basicInvestmentModule, .liabilitiesVsAssetModule, .riskAndReturnModule, .stockRegulatorModule, .fundamentalModule, .newsModule]
        )
    }
    
    func getMockTransactionSchemaData() -> [StockTransactionSchema] {
        return [
            
        ]
    }
    
    func getMockInvestmentData() -> [StockInvestmentSchema] {
        return [

        ]
    }
    
    func getMockNewsSchemaData() -> [StockNewsSchema] {
        // TODO: Fill this later
        let newsData: [StockNewsSchema] =
            HanvestJSONDecoder.decode(from: "HanvestNewsData", as: [StockNewsSchema].self)
                ?? []
        return newsData
    }
    
    func getMockProductPriceSchemaData() -> [ProductPriceSchema] {
        return [
            .init(id: "bbsu-price-init", name: "BBSU", price: 5000, time: Date.now.addingTimeInterval(-30 * 60)),
            .init(id: "bbsu-price-init-2", name: "BBSU", price: 5600, time: Date.now),
            .init(id: "gomm-price-init", name: "GOMM", price: 3000, time: Date.now.addingTimeInterval(-30 * 60)),
            .init(id: "gomm-price-init-2", name: "GOMM", price: 3100, time: Date.now),
            .init(id: "bivi-price-init", name: "BIVI", price: 1500, time: Date.now.addingTimeInterval(-30 * 60)),
            .init(id: "bivi-price-init-2", name: "BIVI", price: 1450, time: Date.now),
            .init(id: "entb-price-init", name: "ENTB", price: 22000, time: Date.now.addingTimeInterval(-30 * 60)),
            .init(id: "entb-price-init-2", name: "ENTB", price: 25500, time: Date.now),
            .init(id: "teja-price-init", name: "TEJA", price: 800, time: Date.now.addingTimeInterval(-30 * 60)),
            .init(id: "teja-price-init-2", name: "TEJA", price: 850, time: Date.now),
            
        ]
    }
    
    func getMockSimulationStockSchemaData() -> [StockSchema] {
        return [
            .init(
                stockIDName: "BBSU",
                stockName: "PT Bank Semua Untung Tbk",
                stockImageName: "BBSU",
                stockDescription: "PT Bank Semua Untung Tbk adalah salah satu bank digital terkemuka di Indonesia yang menyediakan layanan keuangan berbasis teknologi. Fokus utama bank ini adalah meningkatkan aksesibilitas layanan perbankan melalui aplikasi mobile yang canggih dan fitur keamanan tingkat tinggi. Bank ini juga menawarkan berbagai produk investasi digital untuk menarik generasi muda. Dengan jaringan luas dan inovasi berkelanjutan, BBSU berkomitmen untuk menjadi pelopor di bidang perbankan digital di Indonesia."
            ),
            .init(
                stockIDName: "GOMM",
                stockName: "PT Goodfood Maju Makmur Tbk",
                stockImageName: "GOMM",
                stockDescription: "PT Goodfood Maju Makmur Tbk adalah produsen makanan dan minuman yang dikenal dengan produk sehat berbahan dasar alami dan organik. Perusahaan ini memiliki lini produk makanan ringan dan minuman yang dibuat dari bahan-bahan berkualitas tinggi dan ramah lingkungan. GOMM berfokus pada tren pola hidup sehat dan terus berinovasi untuk memenuhi permintaan konsumen terhadap produk vegan dan rendah gula. Mereka juga bekerja sama dengan petani lokal untuk memastikan keberlanjutan bahan baku."
            ),
            .init(
                stockIDName: "BIVI",
                stockName: "PT Brim Vehicle International Tbk.",
                stockImageName: "BIVI",
                stockDescription: "PT Brim Vehicle International Tbk adalah perusahaan otomotif yang berfokus pada produksi kendaraan listrik untuk mendukung transisi energi bersih di Indonesia. BIVI terus berinovasi dalam teknologi kendaraan ramah lingkungan, dengan fasilitas produksi modern yang berlokasi di Jawa Tengah. Selain kendaraan listrik, perusahaan juga mengembangkan teknologi otomotif berbasis AI dan terus memperluas pasar internasional untuk mendukung pertumbuhan yang berkelanjutan."
            ),
            .init(
                stockIDName: "ENTB",
                stockName: "PT Energi Tambang Tbk",
                stockImageName: "ENTB",
                stockDescription: "PT Energi Tambang Tbk adalah perusahaan energi terkemuka yang beroperasi di sektor eksplorasi dan pengolahan batubara. ENTB memiliki beberapa tambang besar di Indonesia dan berkomitmen untuk menerapkan teknologi ramah lingkungan dalam proses produksinya. Dengan fokus pada efisiensi dan keberlanjutan, perusahaan ini juga telah memulai proyek-proyek energi terbarukan untuk mendukung transisi menuju energi bersih di masa depan."
            ),
            .init(
                stockIDName: "TEJA",
                stockName: "PT Telekom Jaya Tbk",
                stockImageName: "TEJA",
                stockDescription: "PT Telekom Jaya Tbk adalah perusahaan telekomunikasi yang menyediakan layanan internet, telepon seluler, dan solusi digital untuk pelanggan di seluruh Indonesia. TEJA terkenal dengan inovasi di bidang jaringan, termasuk pengembangan teknologi 5G dan satelit untuk memperluas jangkauan layanan hingga ke daerah terpencil. Dengan komitmen pada transformasi digital, TEJA berusaha untuk mendukung digitalisasi masyarakat Indonesia melalui produk dan layanan yang andal serta terjangkau."
            )
        ]
    }
    
    func getUserNotificationData() -> [UserNotificationSchema] {
        return [

        ]
    }
}
