//
//  Module06SimulationViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 27/10/24.
//

import Foundation

class Module06SimulationViewModel: HanvestSimulationViewModel {
    @Published var currentStage: Module06Stage?
    
    override func setup(){
        self.stockList = self.prepareStockData()
        self.selectedStockID = stockList.first?.stockIDName ?? ""
    }
    
    func onCompletionModule(appRouter: any AppRouterProtocol) {
        @Inject var validateIfUserComplete: ValidateIfUserHasCompletedTheModule
        
        if let userComplete = try? validateIfUserComplete.execute(specificModule: .module06){
            if userComplete {
                appRouter.popToRoot()
            }
            else {
                appRouter.push(
                    .moduleCompletion(completionItem: .module06)
                )
            }
        }
        else {
            appRouter.popToRoot()
        }
    }
}

private extension Module06SimulationViewModel {
    func prepareStockData() -> [StockEntity] {
        return [
            .init(
                stockIDName: "GOTE",
                stockName: "PT Ganas Ojek Teladan Tbk",
                stockImageName: "GOTE",
                stockDescription:
                """
                PT Goodfood Maju Makmur Tbk adalah produsen makanan dan minuman yang dikenal dengan produk sehat berbahan dasar alami dan organik. Perusahaan ini memiliki lini produk makanan ringan dan minuman yang dibuat dari bahan-bahan berkualitas tinggi dan ramah lingkungan. GOMM berfokus pada tren pola hidup sehat dan terus berinovasi untuk memenuhi permintaan konsumen terhadap produk vegan dan rendah gula. Mereka juga bekerja sama dengan petani lokal untuk memastikan keberlanjutan bahan baku.
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
