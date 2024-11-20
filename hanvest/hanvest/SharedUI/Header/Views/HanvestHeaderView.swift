//
//  HanvestHeaderView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import SwiftUI

struct HanvestHeaderView: View {
    @ObservedObject var userDataViewModel: HanvestLoadedUserDataViewModel
    
    var bookIconTappedAction: () -> ()
    var bellIconTappedAction: () -> ()
    var profileIconTappedAction: () -> ()
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    HanvestHeaderLogo()
                    VStack(alignment: .leading) {
                        Text("Virtual Balance")
                            .font(.nunito(.caption2))
                            .accessibilityHidden(true)
                        Text(
                            HanvestPriceFormatter.formatIntToIDR(
                                userDataViewModel.userData?.userBalance ?? -100
                            )
                        )
                        .font(.nunito(.title2))
                        .showCase(
                            order: MainViewTipData.virtualBalance.index,
                            title: MainViewTipData.virtualBalance.title,
                            detail: MainViewTipData.virtualBalance.detail,
                            stage: HanvestMainViewHighlightStage.mainStage.stringValue
                        )
                        .accessibilityHidden(true)
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel(HanvestPriceFormatter.formatRupiahStringToSpelledOut("virtual money balance \(HanvestPriceFormatter.formatIntToIDR(userDataViewModel.userData?.userBalance ?? -100))"))
                    
                }
                
                Spacer()
                
                HStack(spacing: 20) {
                    Image(systemName: "character.book.closed")
                        .onTapGesture {
                            bookIconTappedAction()
                        }
                        .accessibilityElement(children: .ignore)
                        .accessibilityLabel("glossary icon")
                    
                    Image(systemName: "bell")
                        .onTapGesture {
                            bellIconTappedAction()
                        }
                        .accessibilityElement(children: .ignore)
                        .accessibilityLabel("notification icon")
                    
//                    Image(systemName: "person")
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 25, height: 25)
//                        .onTapGesture {
//                            profileIconTappedAction()
//                        }
//                        .accessibilityElement(children: .ignore)
//                        .accessibilityLabel("user profile icon")
                }
                .font(.system(size: 25))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
        .background(Color.background)
        .shadow(color: Color.black.opacity(0.1), radius: 0, x: 0, y: 1)
    }
}

struct HanvestHeaderLogo: View {
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(.seagull500)
            Image(systemName: "medal")
                .foregroundStyle(.sundown50)
        }
        .frame(width: 43, height: 43)
        .accessibilityHidden(true)
    }
}
