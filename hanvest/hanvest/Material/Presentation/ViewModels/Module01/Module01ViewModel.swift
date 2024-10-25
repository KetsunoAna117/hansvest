//
//  Module01ViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 23/10/24.
//

import Foundation

class Module01ViewModel: ObservableObject {
    @Inject var validateIfUserHasCompletedTheModule: ValidateIfUserHasCompletedTheModule
    
    let progressBarMinValue: Int = 0
    let progressBarMaxValue: Int = 100
    let lastPage = ContentOfModule01Material.page02.rawValue
    
    @Published var currentTab: Int = 0
    @Published var progressBarCurrValue: Int = 4
    @Published var plantingViewVisibility: PlantingViewVisibility = .isVisible
    
    
    func directToCompletionPage(router: any AppRouterProtocol, specificModule: CompletionEntityType) {
        do {
            let isModuleCompleted = try validateIfUserHasCompletedTheModule.execute(specificModule: specificModule)
                
            if isModuleCompleted {
                router.popToRoot()
            } else {
                router.push(.moduleCompletion(completionItem: specificModule))
            }
        }
        catch {
            debugPrint("Failed to direct to completion page: \(error.localizedDescription)")
        }
    }
    
    func goToNextPage(router: any AppRouterProtocol, specificModule: CompletionEntityType) {
        if currentTab < lastPage {
            currentTab += 1
        } else {
            directToCompletionPage(router: router, specificModule: specificModule)
        }
    }
    
    func updateProgressBarValue() {
        if plantingViewVisibility == .isHidden {
            progressBarCurrValue += (progressBarMaxValue / (lastPage + 1))
        }
    }
}
