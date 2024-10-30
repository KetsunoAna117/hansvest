//
//  RiskProfileTextView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 10/10/24.
//

import SwiftUI

struct HanvestRiskProfileOpeningView: View {
    var body: some View {
        VStack(spacing: 85) {
            VStack(spacing: 8) {
                Text("Welcome to Hanvesting")
                    .font(.nunito(.title1, .bold))
                    .frame(maxWidth: .infinity)
                
                Text("Ready to level up?\nFill in your risk profile\nto personalize your learning path")
                    .font(.subheadline)
                    .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
            
            Image("onboarding-hanvest-app-logo")
        }
        .frame(maxWidth: .infinity)
        .multilineTextAlignment(.center)
    }
}

#Preview {
    HanvestRiskProfileOpeningView()
        .padding(.horizontal, 20)
}
