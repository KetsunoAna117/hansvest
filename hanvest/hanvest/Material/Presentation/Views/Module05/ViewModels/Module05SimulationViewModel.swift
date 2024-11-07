//
//  Module05SimulationViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 23/10/24.
//

import Foundation

class Module05SimulationViewModel: HanvestSimulationViewModel {
    @Published var currentStage: Module05Stage?
 
    override func setup(){
        self.stockList = self.prepareStockData()
        self.selectedStockID = stockList.first?.stockIDName ?? ""
    }
    
    func appendNewStockPrice(){
        let index = getSelectedStockIdx(selectedStockID: selectedStockID)
        stockList[index].stockPrice.append(
            .init(id: "BBSU-price-4", name: "BBSU", price: 1020, time: HanvestDateFormatter.stringToDate("2024-10-11 23:00:00"))
        )
    }
    
    func checkForCurrentHighlightedValue(_ value: Int) -> Bool {
        let relevantIndices: Set<Int> = [
            Module05TipData.stocks.index,
            Module05TipData.yourInvestment.index,
            Module05TipData.companyProfile.index
        ]
        
        return relevantIndices.contains(value)
    }
    
}

private extension Module05SimulationViewModel {
    func prepareStockData() -> [StockEntity] {
        return [
            .init(
                stockIDName: "BBSU",
                stockName: "PT Bank Semua Untung Tbk",
                stockImageName: "BBSU",
                stockDescription:
                """
                PT Bank Semua Untung Tbk adalah salah satu bank digital terkemuka di Indonesia yang menyediakan layanan keuangan berbasis teknologi. Fokus utama bank ini adalah meningkatkan aksesibilitas layanan perbankan melalui aplikasi mobile yang canggih dan fitur keamanan tingkat tinggi. Bank ini juga menawarkan berbagai produk investasi digital untuk menarik generasi muda. Dengan jaringan luas dan inovasi berkelanjutan, BBSU berkomitmen untuk menjadi pelopor di bidang perbankan digital di Indonesia.
                """,
                stockPrice: [
                    .init(id: "BBSU-price-1", name: "BBSU", price: 1000, time: HanvestDateFormatter.stringToDate("2024-10-11 19:20:00")),
                    .init(id: "BBSU-price-2", name: "BBSU", price: 1020, time: HanvestDateFormatter.stringToDate("2024-10-11 20:30:00")),
                    .init(id: "BBSU-price-3", name: "BBSU", price: 1015, time: HanvestDateFormatter.stringToDate("2024-10-11 21:40:00")),
                    .init(id: "BBSU-price-4", name: "BBSU", price: 1010, time: HanvestDateFormatter.stringToDate("2024-10-11 22:50:00")),
                ]
            )
        ]
    }
}
