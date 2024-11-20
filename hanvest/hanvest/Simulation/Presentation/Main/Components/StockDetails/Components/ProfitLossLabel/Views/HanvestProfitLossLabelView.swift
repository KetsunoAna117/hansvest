//
//  HanvestProfitLossLabelView.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 11/10/24.
//

import SwiftUI

struct HanvestProfitLossLabelView: View {
    @Binding var initialValue: Int
    @Binding var currentValue: Int
    @StateObject var viewModel = HanvestProfitLossLabelViewModel()
    
    var body: some View {
        let labelState = viewModel.determineLabelState(initialValue, currentValue)
        
        HStack(spacing: 4) {
            Text("\(labelState.symbolType)\(String(format: "%.0f", abs(viewModel.deficit)))")
                .foregroundColor(labelState.textColor)
                .font(.nunito(.caption1))
                .accessibilityLabel("\(labelState.symbolType)\(String(format: "%.0f", abs(viewModel.deficit))) rupiah")
            
            Text("(\(labelState.symbolType)\(String(format: "%.2f", viewModel.percentageValue))%)")
                .foregroundColor(labelState.textColor)
                .font(.nunito(.caption1))
        }
        .onAppear {
            viewModel.calculatePercentageValue(initialValue, currentValue)
        }
        .onChange(of: initialValue) {
            viewModel.calculatePercentageValue(initialValue, currentValue)
        }
        .onChange(of: currentValue) {
            viewModel.calculatePercentageValue(initialValue, currentValue)
        }
    }
}

#Preview {
    @Previewable @State var initialValue: Int = 10000
    @Previewable @State var currentValue: Int = 9500
    
    VStack{
        HanvestProfitLossLabelView(initialValue: $initialValue, currentValue: $currentValue)
    }
}
