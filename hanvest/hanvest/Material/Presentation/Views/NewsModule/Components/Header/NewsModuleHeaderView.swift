//
//  Module06HeaderView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 27/10/24.
//

import SwiftUI

struct NewsModuleHeaderView: View {
    @ObservedObject var userDataViewModel: NewsModuleProfileViewModel
    
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
                }
                .accessibilityElement(children: .combine)
                .accessibilityLabel(HanvestPriceFormatter.formatRupiahStringToSpelledOut("virtual money balance \(HanvestPriceFormatter.formatIntToIDR(userDataViewModel.userData?.userBalance ?? 0))"))
                
                Spacer()
                
                HStack(spacing: 20) {
//                    Image(systemName: "character.book.closed")
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 25, height: 25)
//                        .onTapGesture {
//                            bookIconTappedAction()
//                        }
                    
                    Image(systemName: "bell")
                        .onTapGesture {
                            bellIconTappedAction()
                        }
                        .showCase(
                            order: NewsModuleTipData.notification.index,
                            title: NewsModuleTipData.notification.title,
                            detail: NewsModuleTipData.notification.detail,
                            stage: NewsModuleHighlightStage.mainStage.stringValue
                        )
                        .accessibilityElement(children: .ignore)
                        .accessibilityLabel("notification icon")
                    
//                    Image(systemName: "person")
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 25, height: 25)
//                        .onTapGesture {
//                            profileIconTappedAction()
//                        }
                }
                .font(.system(size: 25))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
        .background(Color.background)
        .shadow(color: Color.black.opacity(0.1), radius: 0, x: 0, y: 1)
        .accessibilityElement(children: .contain)
        .accessibilityLabel("navigation bar")
    }
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .materialNewsModule
    
    NavigationStack(path: $appRouter.path) {
        if let startScreen = startScreen {
            appRouter.build(startScreen)
                .navigationDestination(for: Screen.self) { screen in
                    appRouter.build(screen)
                }
        }
    }
}
