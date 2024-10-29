//
//  AppModule.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

struct AppModule {
    static func inject(){
        
        // MARK: - Repository
        
        let modelContext = SwiftDataContextManager.shared.context
        let userRepository: UserRepository = LocalUserRepository(modelContext: modelContext)
        let simulationNewsRepository: SimulationNewsRepository = LocalSimulationNewsRepository(modelContext: modelContext)
        let simulationStockRepository: SimulationStockRepository = LocalSimulationStockRepository(modelContext: modelContext)
        let productPriceRepository: ProductPriceRepository = LocalProductPriceRepository(modelContext: modelContext)
        let stockTransactionRepository: StockTransactionQueueRepository = LocalStockTransactionQueueRepository(modelContext: modelContext)
        
        // MARK: - USE Case
        
        // Material
        @Provider var getModuleToDisplay: GetModuleToDisplay = GetModuleToDisplayImpl(repo: userRepository)
        @Provider var validateIfUserHasCompletedTheModule: ValidateIfUserHasCompletedTheModule = ValidateIfUserHasCompletedTheModuleImpl(repo: userRepository)
        
        // Simulation
        @Provider var getAvailableStocks: GetAvailableSimulationStocks = GetAvailableSimulationStocksImpl(
            stockRepo: simulationStockRepository,
            productPriceRepo: productPriceRepository
        )
        @Provider var getStockInformationByID: GetStockInformationByID = GetStockInformationByIDImpl(
            stockRepository: simulationStockRepository,
            priceRepository: productPriceRepository
        )
        @Provider var getStockNewsData: GetStockNewsData = GetStockNewsDataImpl(
            newsRepo: simulationNewsRepository
        )
        @Provider var purchaseStock: PurchaseStocks = PurchaseStocksImpl(
            userRepo: userRepository,
            stockTransactionRepository: stockTransactionRepository
        )
        
        // User
        @Provider var calculateUserRiskProfile: CalculateUserRiskProfile = CalculateUserRiskProfileImpl()
        @Provider var getUserData: GetUserData = GetUserDataImpl(
            userRepo: userRepository,
            transactionRepo: stockTransactionRepository
        )
        @Provider var saveUserData: SaveUserData = SaveUserDataImpl(
            userRepo: userRepository
        )
        @Provider var getUserTransaction: GetUserTransaction = GetUserTransactionImpl()
        
        // Simulation and Material
        @Provider var saveUserModuleProgress: SaveUserModuleProgress = SaveUserModuleProgressImpl(
            userRepo: userRepository
        )
    }
}

