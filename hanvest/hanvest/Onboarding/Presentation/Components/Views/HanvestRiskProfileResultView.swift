//
//  RiskProfileQuestionView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 10/10/24.
//

import SwiftUI

struct HanvestRiskProfileResultView: View {
    // Constants
    let resultState: RiskProfileType
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Your risk profile is")
                .font(.nunito(.title2, .bold))
                .frame(maxWidth: .infinity)
            
            resultState.riskImage
            
            VStack(spacing: 18) {
                Text("\(resultState.riskHeaderText)")
                    .font(.nunito(.largeTitle, .bold))
                    .frame(maxWidth: .infinity)
                
                Text("\(resultState.riskDetailText)")
                    .font(.nunito(.body))
                    .frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: .infinity)
        .multilineTextAlignment(.center)
    }
}

#Preview {
    HanvestRiskProfileResultView(
        resultState: .conservative
    )
    .padding(.horizontal, 20)
}
