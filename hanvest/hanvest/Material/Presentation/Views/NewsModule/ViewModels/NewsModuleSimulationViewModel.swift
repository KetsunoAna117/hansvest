//
//  Module06SimulationViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 27/10/24.
//

import Foundation

class NewsModuleSimulationViewModel: HanvestSimulationViewModel {
    @Published var currentStage: NewsModuleStage?
    @Published var otherChoiceIsViewed: Bool = false
    
    override func setup(){
        self.stockList = self.prepareStockData()
        self.selectedStockID = stockList.first?.stockIDName ?? ""
    }
    
    func onConclusionButtonTapped(
        moduleRouter: any NewsModuleRouterProtocol,
        appRouter: any AppRouterProtocol
    ) {
        // Validate if user has viewed other choice
        guard otherChoiceIsViewed else {
            if currentStage == .buyState(appRouter: appRouter) {
                currentStage = .sellState(appRouter: appRouter)
            }
            else {
                currentStage = .buyState(appRouter: appRouter)
            }
            
            otherChoiceIsViewed = true
            moduleRouter.push(
                .conclusion(
                    appRouter: appRouter,
                    simulationViewModel: self
                )
            )
            return
        }
        
        // If user has viewed other choice, go to the completion
        @Inject var validateIfUserComplete: ValidateIfUserHasCompletedTheModule
        
        if let userComplete = try? validateIfUserComplete.execute(specificModule: .newsModule){
            if userComplete {
                appRouter.popToRoot()
            }
            else {
                appRouter.push(
                    .moduleCompletion(completionItem: .newsModule)
                )
            }
        }
        else {
            appRouter.popToRoot()
        }
    }
}

private extension NewsModuleSimulationViewModel {
    func prepareStockData() -> [StockEntity] {
        return [
            .init(
                stockIDName: "GOTE",
                stockName: "PT Ganas Ojek Teladan Tbk",
                stockImageName: "GOTE",
                stockDescription:
                """
                PT Ganas Ojek Teladan Tbk (GOTE) adalah perusahaan transportasi berbasis teknologi yang berfokus pada layanan ojek online di Indonesia. Berdiri dengan tujuan memberikan solusi transportasi cepat, aman, dan terjangkau, GOTE melayani kebutuhan mobilitas masyarakat perkotaan sekaligus membuka peluang ekonomi bagi para mitra pengemudi. Dengan berbagai inovasi dalam teknologi aplikasi dan layanan pengiriman, GOTE terus mengembangkan fitur-fitur tambahan, seperti pesan-antar makanan dan kurir, guna meningkatkan pengalaman pelanggan dan memperluas layanan di seluruh Indonesia.
                """,
                stockPrice: [
                    .init(id: "GOTE-price-1", name: "GOTE", price: 1000, time: HanvestDateFormatter.stringToDate("2024-10-11 19:20:00")),
                    .init(id: "GOTE-price-2", name: "GOTE", price: 1020, time: HanvestDateFormatter.stringToDate("2024-10-11 20:30:00")),
                    .init(id: "GOTE-price-3", name: "GOTE", price: 1015, time: HanvestDateFormatter.stringToDate("2024-10-11 21:40:00")),
                    .init(id: "GOTE-price-4", name: "GOTE", price: 1010, time: HanvestDateFormatter.stringToDate("2024-10-11 22:50:00")),
                ]
            )
        ]
    }
}
