//
//  HanvestHeaderView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import SwiftUI

struct FundamentalModuleHeaderView: View {
    @ObservedObject var userDataViewModel: FundamentalModuleProfileViewModel
    
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
                        Text(
                            HanvestPriceFormatter.formatIntToIDR(
                                userDataViewModel.userData?.userBalance ?? 0
                            )
                        )
                        .font(.nunito(.title2))
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel(HanvestPriceFormatter.formatRupiahStringToSpelledOut("virtual money balance \(HanvestPriceFormatter.formatIntToIDR(userDataViewModel.userData?.userBalance ?? 0))"))
                }
                
                Spacer()
                
//                HStack(spacing: 20) {
//                    Image(systemName: "character.book.closed")
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 25, height: 25)
//                        .onTapGesture {
//                            bookIconTappedAction()
//                        }
//                    Image(systemName: "bell")
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 25, height: 25)
//                        .onTapGesture {
//                            bellIconTappedAction()
//                        }
//                    Image(systemName: "person")
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 25, height: 25)
//                        .onTapGesture {
//                            profileIconTappedAction()
//                        }
//                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
        .background(Color.background)
        .shadow(color: Color.black.opacity(0.1), radius: 0, x: 0, y: 1)
    }
}
