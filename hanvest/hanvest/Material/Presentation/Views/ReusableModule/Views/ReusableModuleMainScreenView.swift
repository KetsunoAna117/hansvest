//
//  SectorModuleMainScreenView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/11/24.
//

import SwiftUI

struct ReusableModuleMainScreenView: View {
    let appRouter: any AppRouterProtocol
    let viewModel: ReusableContentViewModels
    @StateObject private var moduleRouter: ReusableModuleRouter = .init()
    
    var body: some View {
        ZStack {
            Color.background
            
            VStack(spacing: 40) {
                ProgressBarWithXMarkView(
                    progressBarMinValue: 0,
                    progressBarMaxValue: viewModel.content.count - 1,
                    action: {
                        appRouter.popToRoot()
                    },
                    progressBarCurrValue: $moduleRouter.progress
                )
                .padding(.horizontal, 12)
                
                if let screen = moduleRouter.content.last {
                    moduleRouter.build(screen)
                }
            }
            .padding(.top, 56)
            .frame(maxHeight: .infinity, alignment: .top)
            .onAppear() {
                viewModel.setup(
                    appRouter: appRouter,
                    moduleRouter: moduleRouter
                )
            }
        }
        .ignoresSafeArea()
    }
}

//#Preview {
//    let viewModel : ReusableContentViewModels = .init(
//        content: ReusableContentViewModels.getContent(),
//        completionEntityType: .sectorModule
//    )
//    ReusableModuleMainScreenView(
//        viewModel: viewModel
//    )
//}
