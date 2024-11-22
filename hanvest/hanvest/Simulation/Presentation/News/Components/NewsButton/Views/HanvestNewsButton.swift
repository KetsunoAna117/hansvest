//
//  HanvestNewsButton.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 15/10/24.
//

import SwiftUI

struct HanvestNewsButton: View {
    // State for styling and prevent rapid multiple actions
    @State private var state: HanvestNewsButtonState = .unpressed
    
    var notification: UserNotificationEntity
    var action: () -> ()
    
    var body: some View {
        Button {
            if state == .unpressed {
                state = .pressed
                
                HanvestSoundFXManager.playSound(soundFX: HanvestSoundFX.click)
                HanvestHapticManager.hapticNotif(type: .success)
                
                action()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    state = .unpressed
                }
            }
        } label: {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    HStack(alignment: .top) {
                        Text(notification.stockNews.stockIDName)
                            .font(.nunito(.subhead, .bold))
                        Text("Report: \(notification.stockNews.newsTitle)")
                            .font(.nunito(.subhead))
                    }
                    Text(
                        HanvestDateFormatter.getTimeDifferenceFrom(notification.releasedTime)
                    )
                        .font(.nunito(.caption1))
                        .foregroundStyle(.secondary)
                }
                .padding(12)
                Spacer()
            }
        }
        .buttonStyle(HanvestNewsButtonType(state: state))
        .disabled(state == .pressed)
    }
    
}

//#Preview {
//    HanvestNewsButton(
//        news: StockNewsEntity.mock().first!,
//        action: {
//            debugPrint("News Pressed!")
//        }
//    )
//    .padding(.horizontal, 16)
//}
