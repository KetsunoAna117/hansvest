//
//  Module04NumberedListContent.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

enum Module04NumberedListContent: Int {
    case page11 = 10
    
    var title: Text {
        switch self {
            case .page11:
            Text("Self Regulator Organizations").font(.nunito(.title2, .bold))
        }
    }
    
    var detailText: Text {
        switch self {
            case .page11:
            Text("In Indonesia's capital market, Self-Regulatory Organizations (SROs) have the authority to create rules for their members. There are three key SROs:").font(.nunito(.body))
        }
    }
    
    var numberedLists: [String] {
        switch self {
            case .page11:
                [
                    "Indonesia Stock Exchange (IDX): IDX provides a platform for buying and selling stocks, ensuring trades are orderly and efficient. It is operated by PT Bursa Efek Indonesia.",
                    "Indonesian Clearing and Guarantee Corporation (KPEI): KPEI clears and guarantees stock transactions, defining members' rights and obligations after a trade. It is managed by PT Kliring dan Penjaminan Efek Indonesia.",
                    "Indonesian Central Securities Depository (KSEI): KSEI oversees the custody and settlement of securities, ensuring smooth and efficient transactions. This is handled by PT Kustodian Sentral Efek Indonesia, in line with Indonesia’s Capital Market Law."
                ]
        }
    }
    
    var image: [Image] {
        switch self {
            case .page11:
                [
                    Image("kpei-logo"),
                    Image("IDX-logo"),
                    Image("ksei-logo")
                ]
        }
    }
}
