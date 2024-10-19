//
//  TransactionStatusView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 19/10/24.
//

import SwiftUI

struct TransactionStatusView: View {
    var lotAmount: Int
    var stockPrice: Int
    var selectedStockIDName: String
    
    var transactionType: TransactionType
    
    var body: some View {
        ZStack {
            VStack {
                TransactionStatusLogo()
                VStack {
                    Text("Order Placed!")
                        .font(.nunito(.title1, .bold))
                    Text("\(lotAmount) lot of \(selectedStockIDName) at price \(stockPrice) \(transactionType.description)")
                }
                .padding(.top, 50)
            }
            .padding(.bottom, 50)
            
            HanvestButtonDefault(
                title: "Back To Market",
                action: {
                    print("Back to market action triggered!")
                }
            )
            .padding(.horizontal, 20)
            .padding(.vertical, 50)
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

private struct TransactionStatusLogo: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(.blizzardBlue200)
                .frame(width: 310, height: 310)
            ZStack {
                Circle()
                    .fill(.blizzardBlue400)
                    .frame(width: 250, height: 250)
                Image(systemName: "checkmark")
                    .resizable()
                    .foregroundStyle(.mineShaft50)
                    .frame(width: 100, height: 100)
            }
            
            
        }
    }
}

#Preview {
    ZStack {
        Color.background.ignoresSafeArea()
        TransactionStatusView(
            lotAmount: 1,
            stockPrice: 5000,
            selectedStockIDName: "BBRI",
            transactionType: .buy
        )
    }
}
