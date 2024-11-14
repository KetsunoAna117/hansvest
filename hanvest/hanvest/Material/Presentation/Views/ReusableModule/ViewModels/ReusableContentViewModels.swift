//
//  SectorContentViewModels.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/11/24.
//

import Foundation
import SwiftUI

class ReusableContentViewModels: ObservableObject {
    @Published var content: [any HanvestModuleContent]
    @Published var completionEntityType: CompletionEntityType
    
    var appRouter: (any AppRouterProtocol)?
    
    init(
        content: [any HanvestModuleContent],
        completionEntityType: CompletionEntityType
    ){
        self.content = content
        self.completionEntityType = completionEntityType
    }
    
    func next(moduleRouter: any ReusableModuleRouterProtocol){
        guard moduleRouter.progress < content.count - 1 else {
            guard let appRouter = appRouter else {
                debugPrint("ERROR! App Router is not intialized!")
                return
            }
            
            onModuleCompletion(appRouter: appRouter)
            debugPrint("End of file")
            return
        }
        
        moduleRouter.addProgress() // Add Progress
        
        let nextContent = content[moduleRouter.progress]
        executeContent(content: nextContent, moduleRouter: moduleRouter)
        
    }
    
    func setup(
        appRouter: any AppRouterProtocol,
        moduleRouter: any ReusableModuleRouterProtocol
    ){
        self.appRouter = appRouter
        
        // Display First Content
        guard let content = self.content.first else {
            debugPrint("ERROR: No Content detected!")
            return
        }
        
        executeContent(content: content, moduleRouter: moduleRouter)
    }
    
    func executeContent(
        content: any HanvestModuleContent,
        moduleRouter: any ReusableModuleRouterProtocol
    ) {
        switch content {
        case let content as ReusableModuleInformationEntity:
            moduleRouter.push(
                .information(
                    data: content,
                    onContinueAction: {
                        self.next(moduleRouter: moduleRouter)
                    }
                )
            )
            
        case let content as ReusableModuleEvaluationEntity:
            moduleRouter.push(
                .multipleChoice(
                    data: content,
                    onContinueAction: {
                        self.next(moduleRouter: moduleRouter)
                    }
                )
            )
            
        default:
            debugPrint("ERROR: Can't Type Cast")
            break
        }
    }
    
    func onModuleCompletion(
        appRouter: any AppRouterProtocol
    ){
        // If user has viewed other choice, go to the completion
        @Inject var validateIfUserComplete: ValidateIfUserHasCompletedTheModule
        
        if let userComplete = try? validateIfUserComplete.execute(specificModule: completionEntityType){
            if userComplete {
                appRouter.popToRoot()
            }
            else {
                appRouter.push(
                    .moduleCompletion(completionItem: completionEntityType)
                )
            }
        }
        else {
            appRouter.popToRoot()
        }
    }
}

