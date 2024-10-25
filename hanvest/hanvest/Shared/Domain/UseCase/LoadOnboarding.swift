//
//  LoadShowOnboarding.swift
//  hanvest
//
//  Created by Bryan Vernanda on 24/10/24.
//

protocol LoadOnboarding {
    func execute()
}

struct LoadOnboardingImpl: LoadOnboarding {
    let userRepo: UserRepository
    
    func execute() {
        if userRepo.fetch() != nil {
            
        }
    }
}
