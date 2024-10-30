//
//  CompletionCardStyleViewModifier.swift
//  hanvest
//
//  Created by Bryan Vernanda on 14/10/24.
//

import SwiftUI

struct CompletionCardStyleViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .background(Color.mineShaft50)
            .cornerRadius(12)
            .shadow(color: Color(red: 0.15, green: 0.15, blue: 0.15).opacity(0.1), radius: 2, x: 0, y: 0.33)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .inset(by: 0.5)
                    .stroke(Color.mineShaft200, lineWidth: 1)
            )
    }
}

extension View {
    func completionCardStyle() -> some View {
        self.modifier(CompletionCardStyleViewModifier())
    }
}
