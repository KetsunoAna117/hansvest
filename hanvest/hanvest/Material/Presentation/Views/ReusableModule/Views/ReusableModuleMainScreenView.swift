//
//  SectorModuleMainScreenView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/11/24.
//

import SwiftUI

struct ReusableModuleMainScreenView: View {
//    let appRouter: any AppRouterProtocol
    let viewModel: ReusableContentViewModels
    @StateObject private var moduleRouter: ReusableModuleRouter = .init()
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                ProgressBarWithXMarkView(
                    progressBarMinValue: 0,
                    progressBarMaxValue: viewModel.content.count - 1,
                    action: {
                        // Use App Router to go back
                    },
                    progressBarCurrValue: $moduleRouter.progress
                )
                .padding(.bottom, 4)
                .padding(.horizontal, 16)
                
                if let screen = moduleRouter.content.last {
                    moduleRouter.build(screen)
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .onAppear() {
                viewModel.setup(moduleRouter: moduleRouter)
            }
        }
    }
}

#Preview {
    let viewModel : ReusableContentViewModels = .init(
        content: ReusableContentViewModels.getContent(),
        completionEntityType: .module07
    )
    ReusableModuleMainScreenView(
        viewModel: viewModel
    )
}
