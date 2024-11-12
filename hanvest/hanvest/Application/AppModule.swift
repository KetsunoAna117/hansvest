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
        let simulationNewsRepository: StockNewsRepository = LocalSimulationNewsRepository(modelContext: modelContext)
        let simulationStockRepository: StockRepository = LocalSimulationStockRepository(modelContext: modelContext)
        let productPriceRepository: ProductPriceRepository = LocalProductPriceRepository(modelContext: modelContext)
        let stockTransactionRepository: StockTransactionRepository = LocalStockTransactionRepository(modelContext: modelContext)
        let stockTransactionQueueRepository: StockTransactionQueueRepository = LocalStockTransactionQueueRepository(modelContext: modelContext)
        let stockInvestmentRepository: StockInvestmentRepository = LocalStockInvestmentRepository(modelContext: modelContext)
        let userNotificationRepository: UserNotificationRepository = LocalUserNotificationRepository(modelContext: modelContext)
        
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
        @Provider var getStockNewsData: UpdateStockPriceByNews = UpdateStockPriceByNewsImpl(
            stockPriceRepo: productPriceRepository
        )
        @Provider var triggerLatestNotification: TriggerLatestNotification = TriggerLatestNotificationImpl(
            notificationRepo: userNotificationRepository
        )
        @Provider var sendStockPriceUpdateNotification: SendStockPriceUpdateNotification = SendStockPriceUpdateNotificationImpl(
            newsRepo: simulationNewsRepository,
            userNotificationRepo: userNotificationRepository
        )
        @Provider var purchaseStock: PurchaseStocks = PurchaseStocksImpl(
            userRepo: userRepository,
            investmentRepo: stockInvestmentRepository,
            transactionRepo: stockTransactionRepository
        )
        @Provider var sellStock: SellStocks = SellStocksImpl(
            userRepo: userRepository,
            investmentRepo: stockInvestmentRepository,
            transactionRepo: stockTransactionRepository
        )
        
        // User
        @Provider var calculateUserRiskProfile: CalculateUserRiskProfile = CalculateUserRiskProfileImpl()
        @Provider var getUserData: GetUserData = GetUserDataImpl(
            userRepo: userRepository,
            transactionRepo: stockTransactionRepository,
            transactionQueueRepo: stockTransactionQueueRepository,
            investmentRepo: stockInvestmentRepository,
            notificationRepo: userNotificationRepository,
            newsRepo: simulationNewsRepository
        )
        @Provider var saveUserData: SaveUserData = SaveUserDataImpl(
            userRepo: userRepository
        )
        @Provider var getUserInvestment: GetUserInvestmentData = GetUserInvestmentDataImpl()
        
        // Simulation and Material
        @Provider var saveUserModuleProgress: SaveUserModuleProgress = SaveUserModuleProgressImpl(
            userRepo: userRepository
        )
    }
}

