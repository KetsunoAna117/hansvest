//
//  ModuleJourneyViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 12/10/24.
//

import Foundation


class ModuleJourneyViewModel: ObservableObject {
    @Inject var getModuleToDisplay: GetModuleToDisplay
    @Inject var getUserData: GetUserData
    
    var numberOfModules: Int
    @Published var moduleProgressList: [ModuleNavigatiorEntity]
    
    init() {
        numberOfModules = 0
        moduleProgressList = []
    }
    
    func setup() {
        guard let user = getUserData.execute() else {
            fatalError("User not found!")
        }
        
        let moduleCompletionList = user.moduleCompletionList
        
        // Create a set of completed module IDs for fast lookup
        let completedModuleIDs = Set(moduleCompletionList.map { $0.value.moduleID })
        
        moduleProgressList = getModuleToDisplay.execute()
        self.numberOfModules = moduleProgressList.count
        
        // Update the state of modules based on completion list
        for (index, module) in moduleProgressList.enumerated() {
            if completedModuleIDs.contains(module.moduleID) {
                moduleProgressList[index].state = .done
            }
        }
        
        // Set the current module to progress
        setCurrentModuleToProgress()
    }

    func setCurrentModuleToProgress() {
        // Ensure we don't run out-of-bounds when accessing moduleProgressList[i+1]
        for i in 0..<moduleProgressList.count - 1 {
            if moduleProgressList[0].state == .next {
                moduleProgressList[0].state = .current
                return
            }
            else if moduleProgressList[i].state == .done && moduleProgressList[i + 1].state == .next {
                moduleProgressList[i + 1].state = .current
                return
            }
        }
    }
    
    func getModuleIdx(module: ModuleNavigatiorEntity) -> Int {
        return moduleProgressList.firstIndex(where: {
            $0.moduleID == module.moduleID
        }) ?? 0
    }

    
//    func updateUserModuleProgressIfDone(moduleIndex: Int) {
//        if moduleIndex >= 1 && moduleIndex < numberOfModules {
//            userTempModulesProgress[moduleIndex-1] = .done
//            if userTempModulesProgress[moduleIndex] == .next {
//                userTempModulesProgress[moduleIndex] = .current
//            }
//        } else {
//            userTempModulesProgress[moduleIndex-1] = .done
//        }
//    }
    
//    func getUserModuleProgress(moduleIndex: Int) -> HanvestModuleNumberDefaultStyle {
//        if moduleIndex >= 1 && moduleIndex <= numberOfModules {
//            return userTempModulesProgress[moduleIndex - 1]
//        } else {
//            return .next
//        }
//    }
}
