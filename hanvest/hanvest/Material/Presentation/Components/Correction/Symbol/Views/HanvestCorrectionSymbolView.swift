//
//  HanvestCorrectionSymbol.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 10/10/24.
//

import SwiftUI

struct HanvestCorrectionSymbolView: View {
    var state: HanvestCorrectionSymbolState
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(state.backgroundColor)
            Image(systemName: state.icon)
                .resizable()
                .frame(width: 12, height: 12)
                .foregroundStyle(state.fontColor)
        }
        .frame(width: 22, height: 22)
    }
}

#Preview {
    HanvestCorrectionSymbolView(state: .correct)
}
