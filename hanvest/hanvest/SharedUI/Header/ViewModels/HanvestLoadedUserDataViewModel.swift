//
//  HanvestLoadedUserDataViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import Foundation

class HanvestLoadedUserDataViewModel: ObservableObject {
    @Inject var getUserData: GetUserData
    
    @Published var userData: UserDataEntity?
    
    func setup(){
        if let user = getUserData.execute() {
            userData = user
        }
        
    }

    
}
