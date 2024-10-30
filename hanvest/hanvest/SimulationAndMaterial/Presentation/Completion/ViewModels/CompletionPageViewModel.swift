//
//  CompletionPageViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 22/10/24.
//

struct CompletionPageViewModel {
    @Inject var saveUserModuleProgress: SaveUserModuleProgress
    
    func saveData(router: any AppRouterProtocol, completionItem: CompletionEntityType) {
        do {
            try saveUserModuleProgress.execute(data: completionItem)
            router.popToRoot()
        }
        catch {
            debugPrint("Failed to save user data: \(error.localizedDescription)")
        }
    }
}
