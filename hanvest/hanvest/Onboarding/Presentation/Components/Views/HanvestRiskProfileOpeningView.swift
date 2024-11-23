//
//  RiskProfileTextView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 10/10/24.
//

import SwiftUI

struct HanvestRiskProfileOpeningView: View {
    var body: some View {
        VStack(spacing: 68) {
            VStack(spacing: 16) {
                Text("Welcome to Hanvest")
                    .font(.nunito(.title1, .bold))
                    .frame(maxWidth: .infinity)
                
                Text("Ready to level up?\nComplete your risk profile for a more tailored\nlearning experience")
                    .font(.subheadline)
                    .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
            
            Image("onboarding-hanvest-app-logo")
                .resizable()
                .frame(width: 173, height: 173)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .frame(maxWidth: .infinity)
        .multilineTextAlignment(.center)
    }
}

#Preview {
    HanvestRiskProfileOpeningView()
        .padding(.horizontal, 20)
}
