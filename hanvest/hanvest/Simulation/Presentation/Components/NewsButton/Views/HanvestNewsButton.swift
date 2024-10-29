//
//  HanvestNewsButton.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 15/10/24.
//

import SwiftUI

struct HanvestNewsButton: View {
    // Constant
    let SHADOW_OFFSET: CGFloat = 5
    
    // State
    var initialState: HanvestNewsButtonState = .unpressed
    @State private var state: HanvestNewsButtonState = .unpressed
    
    var news: StockNewsEntity
    var action: () -> ()
    
    var body: some View {
        HStack() {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(news.stockIDName)
                        .font(.nunito(.subhead, .bold))
                    Text("Report: \(news.newsTitle)")
                        .font(.nunito(.subhead))
                }
                Text(
                    HanvestDateFormatter.getTimeDifferenceFrom(news.newsReleasedTime)
                )
                    .font(.nunito(.caption1))
                    .foregroundStyle(.secondary)
            }
            .padding(12)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(state.borderColor, lineWidth: 0.5) // Default stroke
        )
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(state.backgroundColor)
                .shadow(
                    color: getPressedStatus() ? .clear : state.shadowColor,
                    radius: getPressedStatus() ? 0 : 0, x: 0, y: getPressedStatus() ? 0 : SHADOW_OFFSET // Shadow changes when pressed
                )
            
        )
        .offset(y: getPressedStatus() ? SHADOW_OFFSET : 0)
        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: self.state)
        .onTapGesture {
            self.state = .pressed
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                self.state = .unpressed
                action()
            })
        }
        .onAppear(){
            self.state = self.initialState
        }
    }
    
    func getPressedStatus() -> Bool {
        return state == .pressed
    }
}

//#Preview {
//    HanvestNewsButton(
//        news: StockNewsEntity.mock().first!,
//        action: {
//            print("News Pressed!")
//        }
//    )
//    .padding(.horizontal, 16)
//}
