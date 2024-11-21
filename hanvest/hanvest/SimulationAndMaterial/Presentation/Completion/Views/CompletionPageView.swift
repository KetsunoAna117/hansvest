//
//  CompletionPageView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 14/10/24.
//

import SwiftUI

struct CompletionPageView: View {
    // Constants
    let router: any AppRouterProtocol
    let completionItem: CompletionEntityType
    
    private let viewmodel = CompletionPageViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 54) {
                    VStack(spacing: 78) {
                        VStack(spacing: 15) {
                            Text("Congratulations!")
                                .font(.nunito(.title1, .bold))
                                .frame(maxWidth: .infinity)
                            
                            Image(completionItem.value.badgeImageName)
                        }
                        
                        VStack(spacing: 0) {
                            HStack {
                                Text("You earned ")
                                    .font(.nunito(.body)) +
                                Text("\"\(completionItem.value.badgeName)\"")
                                    .font(.nunito(.body, .bold))
                            }
                            .frame(maxWidth: .infinity)
                            
                            HStack {
                                Text("for completing ")
                                    .font(.nunito(.body)) +
                                Text("\"\(completionItem.value.achievedAfterCompleting)\"")
                                    .font(.nunito(.body, .bold))
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.vertical, 20)
                    .completionCardStyle()
                    
                    ZStack {
                        VStack(spacing: 4) {
                            Text("Bonus:")
                                .font(.nunito(.body))
                                .frame(maxWidth: .infinity)
                            
                            Text(HanvestPriceFormatter.formatIntToIDR(completionItem.value.bonusMoney))
                                .font(.nunito(.title1, .bold))
                                .frame(maxWidth: .infinity)
                                .accessibilityLabel(HanvestPriceFormatter.formatRupiahStringToSpelledOut(HanvestPriceFormatter.formatIntToIDR(completionItem.value.bonusMoney)))
                            
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 46)
                    .completionCardStyle()
                }
            }
            .scrollBounceBehavior(.basedOnSize, axes: [.vertical])
            
            ZStack {
                HanvestButtonDefault(
                    title: "Claim Reward"
                ) {
                    viewmodel.saveData(
                        router: self.router,
                        completionItem: self.completionItem
                    )
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 20)
        .padding(.top, 40)
        .padding(.bottom, 54)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .onAppear {
            HanvestSoundFXManager.playSound(soundFX: HanvestSoundFX.getBadge)
        }
        .accessibilityElement(children: .contain)
        .accessibilityLabel("\(completionItem.value.achievedAfterCompleting) award page")
    }
}



#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .moduleCompletion(completionItem: .basicInvestmentModule)
    
    NavigationStack(path: $appRouter.path) {
        if let startScreen = startScreen {
            appRouter.build(startScreen)
                .navigationDestination(for: Screen.self) { screen in
                    appRouter.build(screen)
                }
        }
    }
}
