//
//  Module02View.swift
//  hanvest
//
//  Created by Bryan Vernanda on 15/10/24.
//

import SwiftUI

struct MaterialLiabilitiesVsAssetModuleScreenView: View {
    let router: any AppRouterProtocol
    
    // View Models
    @StateObject private var viewModel = LiabilitiesVsAssetModuleViewModel()
    
    var body: some View {
        ZStack {
            Color.background
            
            ZStack {
                VStack(spacing: (UIScreen.main.bounds.width < 385) ? 20 : 40) {
                    ProgressBarWithXMarkView(
                        progressBarMinValue: viewModel.progressBarMinValue,
                        progressBarMaxValue: viewModel.progressBarMaxValue,
                        action: {
                            router.popToRoot()
                        },
                        progressBarCurrValue: $viewModel.progressBarCurrValue
                    )
                    .padding(.horizontal, -8)
                    
                    VStack(spacing: (UIScreen.main.bounds.width < 385) ? 24 : 48) {
                        TabView(selection: $viewModel.currentTab) {
                            
                            ForEach(Array(LiabilitiesVsAssetModuleTextImagePageContent.allCases.enumerated()), id: \.offset) { index, page in
                                
                                LiabilitiesVsAssetModuleTextImageView(
                                    title: page.title,
                                    image: page.image,
                                    customSpacing: page.customSpacing
                                )
                                .tag(page.rawValue)
                                .transition(.slide)
                                .frame(maxHeight: .infinity, alignment: .top)
                                
                            }
                            
                            ForEach(Array(LiabilitiesVsAssetModuleMultipleChoicePageContent.allCases.enumerated()), id: \.offset) { index, page in
                                
                                HanvestMultipleChoiceView(
                                    question: page.questions,
                                    options: page.options,
                                    image: page.image,
                                    onSelectAnswer: { answer in
                                        viewModel.userSelectedAnswers[page.rawValue] = answer
                                    }
                                )
                                .tag(page.rawValue)
                                .transition(.slide)
                                .frame(maxHeight: .infinity, alignment: .top)
                                
                            }
                            
                            LiabilitiesVsAssetModuleTextImageColorPickerView(
                                title: LiabilitiesVsAssetModuleTextImageColorPickerPageContent.page04.title,
                                image: LiabilitiesVsAssetModuleTextImageColorPickerPageContent.page04.image,
                                needColorPicker: true,
                                onSelectAnswer: { answer in
                                    viewModel.userSelectedAnswers[LiabilitiesVsAssetModuleTextImageColorPickerPageContent.page04.rawValue] = answer
                                }
                            )
                            .tag(LiabilitiesVsAssetModuleTextImageColorPickerPageContent.page04.rawValue)
                            .transition(.slide)
                            .frame(maxHeight: .infinity, alignment: .top)
                            
                            ForEach(Array(LiabilitiesVsAssetModuleHeaderWithDetailTextPageContent.allCases.enumerated()), id: \.offset) { index, page in
                                
                                HanvestMaterialInformationView(
                                    title: page.title(
                                        chosenPhone: viewModel.userSelectedAnswers[LiabilitiesVsAssetModuleMultipleChoicePageContent.page03.rawValue],
                                        chosenMethod: viewModel.userSelectedAnswers[LiabilitiesVsAssetModuleMultipleChoicePageContent.page07.rawValue]
                                    ),
                                    detailText: page.detailText(
                                        chosenPhone: viewModel.userSelectedAnswers[LiabilitiesVsAssetModuleMultipleChoicePageContent.page03.rawValue],
                                        chosenMethod: viewModel.userSelectedAnswers[LiabilitiesVsAssetModuleMultipleChoicePageContent.page07.rawValue]
                                    )
                                )
                                .tag(page.rawValue)
                                .transition(.slide)
                                .frame(maxHeight: .infinity, alignment: .top)
                                
                            }
                            
                        }
                        .frame(maxWidth: .infinity)
                        .tabViewStyle(.page(indexDisplayMode: .never))
                        .indexViewStyle(.page(backgroundDisplayMode: .always))
                        .onAppear {
                            UIScrollView.appearance().isScrollEnabled = false
                        }
                        
                        ZStack {
                            HanvestButtonDefault(
                                style: .filled(isDisabled: viewModel.checkIsDisabled()),
                                title: viewModel.pageState.buttonStringValue
                            ) {
                                viewModel.goToNextPage(
                                    router: self.router,
                                    specificModule: .liabilitiesVsAssetModule
                                )
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.top, (UIScreen.main.bounds.width < 385) ? 16 : 56)
            .padding(.bottom, (UIScreen.main.bounds.width < 385) ? 30 : 54)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .materialLiabilitiesVsAsset
    
    NavigationStack(path: $appRouter.path) {
        if let startScreen = startScreen {
            appRouter.build(startScreen)
                .navigationDestination(for: Screen.self) { screen in
                    appRouter.build(screen)
                }
                .overlay {
                    if let popup = appRouter.popup {
                        ZStack {
                            appRouter.build(popup)
                        }
                       
                    }
                }
        }
    }
}
