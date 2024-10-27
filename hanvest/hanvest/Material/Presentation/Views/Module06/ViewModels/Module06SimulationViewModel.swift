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
    func prepareStockData() -> [SimulationStockEntity] {
        return [
            .init(
                stockIDName: "GOTO",
                stockName: "PT GoTo Gojek Tokopedia Tbk",
                stockImageName: "GOTO-logo",
                stockDescription:
                """
                GoTo Gojek Tokopedia (atau GoTo) adalah perusahaan ekosistem digital berbasis teknologi yang beroperasi di Indonesia, yang dibentuk sebagai penggabungan antara Gojek dan Tokopedia. Berbasis di Jakarta. GoTo telah menjadi ekosistem terbarukan mewujudkan ketahanan identitas korporasi.

                GoTo bermula sebagai perusahaan yang menyediakan layanan transportasi daring dengan nama badan hukum PT. Aplikasi Karya Anak Bangsa, yang menggunakan nama Gojek. Perusahaan kemudian berubah nama menjadi GoTo setelah bergabungnya Tokopedia, yang merupakan salah satu lokapasar daring terbesar di Indonesia, pada tahun 2021. GoTo menawarkan layanan-layanan seperti transportasi berbagi tumpangan (GoCar dan GoRide), layanan logistik on-demand (GoSend), dan lokapasar (Tokopedia). Selain itu terdapat Goto Financial yang membawahi pembayaran digital (GoPay), kasir berbasis komputasi awan (MokaPOS) dan gerbang pembayaran (Midtrans).

                Pada tahun 2022, GoTo menjadi perusahaan Dekacorn pertama yang menjadi perusahaan terbuka di bursa efek kawasan Asia Tenggara,[2] dengan nilai penawaran umum sebesar Rp 15,8 triliun (sekitar US$1,1 miliar),[3] yang menjadikan IPO GoTo terbesar di Indonesia, ketiga di Asia, dan kelima di dunia, pada periode Januari-April 2022.[4]GoTo adalah salah satu dari lima perusahaan dengan kapitalisasi pasar terbesar di Bursa Efek Indonesia (BEI), dengan kapitalisasi pasar mencapai Rp 452 triliun per 11 April 2022.[5]
                """,
                stockPrice: [
                    .init(id: "GOTO-price-1", name: "GOTO", price: 1000, time: HanvestDateFormatter.stringToDate("2024-10-11 19:20:00")),
                    .init(id: "GOTO-price-2", name: "GOTO", price: 1020, time: HanvestDateFormatter.stringToDate("2024-10-11 20:30:00")),
                    .init(id: "GOTO-price-3", name: "GOTO", price: 1015, time: HanvestDateFormatter.stringToDate("2024-10-11 21:40:00")),
                    .init(id: "GOTO-price-4", name: "GOTO", price: 1010, time: HanvestDateFormatter.stringToDate("2024-10-11 22:50:00")),
                ]
            )
        ]
    }
}
