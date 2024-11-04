//
//  HanvestLoadedUserDataViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import Foundation

class HanvestLoadedUserDataViewModel: ObservableObject {
    @Inject var getUserData: GetUserData
    
    @Published var isHighlightEverShown: Bool
    @Published var userData: UserDataEntity?
    
    init() {
        isHighlightEverShown = UserDefaults.standard.bool(forKey: "HighlightEverShown")
    }
    
    func setup(){
        if let user = getUserData.execute() {
            userData = user
        }
        
    }
    
    func toggleHighlightEverShown() {
        UserDefaults.standard.set(true, forKey: "HighlightEverShown")
    }
    
}
