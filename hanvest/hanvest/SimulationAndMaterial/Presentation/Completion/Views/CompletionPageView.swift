//
//  CompletionPageView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 14/10/24.
//

import SwiftUI

struct CompletionPageView: View {
    // Constant
    let router: any AppRouterProtocol
    let completionItem: CompletionEntityType
    
    private let viewmodel = CompletionPageViewModel()
    
    var body: some View {
        ZStack {
            Color.background
            
            ZStack {
                VStack(spacing: 48) {
                    VStack(spacing: 54){
                        VStack(spacing: 78) {
                            VStack(spacing: 15) {
                                Text("Congratulations!")
                                    .font(.nunito(.title1, .bold))
                                    .frame(maxWidth: .infinity)
                                
                                Image(completionItem.value.badgeImageName)
                            }
                            
                            VStack(spacing: 0) {
                                HStack {
                                    Text(
                                        "You earned "
                                    ).font(.nunito(.body)) +
                                    Text(
                                        "\"\(completionItem.value.badgeName)\""
                                    ).font(.nunito(.body, .bold))
                                }
                                .frame(maxWidth: .infinity)
                                
                                HStack {
                                    Text(
                                        "for completing "
                                    ).font(.nunito(.body)) +
                                    Text(
                                        "\"\(completionItem.value.achievedAfterCompleting)\""
                                    ).font(.nunito(.body, .bold))
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
                                
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 46)
                        .completionCardStyle()
                    }
                    
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
                .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 54)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .moduleCompletion(completionItem: .module01)
    
    NavigationStack(path: $appRouter.path) {
        if let startScreen = startScreen {
            appRouter.build(startScreen)
                .navigationDestination(for: Screen.self) { screen in
                    appRouter.build(screen)
                }
        }
    }
}
