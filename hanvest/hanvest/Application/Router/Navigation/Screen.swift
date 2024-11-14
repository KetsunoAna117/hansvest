//
//  Screen.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 15/10/24.
//

import Foundation

enum Screen: Identifiable, Hashable, Equatable {
    case debug
    case onboarding
    case main
    case news(userViewModel: HanvestLoadedUserDataViewModel)
    case newsDetails(notification: UserNotificationEntity)
    case glossary
    case searchGlossary(glossaryViewModel: GlossaryViewModel)
    case profile
    case materialModule01
    case materialModule02
    case materialModule03
    case materialModule04
    case materialModule05
    case materialModule06
    case simulationBuyingConfirmation(viewModel: HanvestSimulationViewModel, userData: UserDataEntity)
    case simulationSellingConfirmation(viewModel: HanvestSimulationViewModel, userData: UserDataEntity)
    case transactionStatus(transaction: TransactionStatusViewModel)
    case moduleCompletion(completionItem: CompletionEntityType)
    case reusableMaterialModule(material: ReusableContentViewModels)
    
    var id: Self { return self }
}

extension Screen {
    // Conform to Hashable
    func hash(into hasher: inout Hasher) {
        switch self {
        case .debug:
            hasher.combine(self.hashValue)
        case .onboarding:
            hasher.combine(self.hashValue)
        case .simulationBuyingConfirmation:
            hasher.combine(self.hashValue)
        case .simulationSellingConfirmation:
            hasher.combine(self.hashValue)
        case .profile:
            hasher.combine(self.hashValue)
        case .main:
            hasher.combine(self.hashValue)
        case .materialModule01:
            hasher.combine(self.hashValue)
        case .materialModule02:
            hasher.combine(self.hashValue)
        case .materialModule03:
            hasher.combine(self.hashValue)
        case .materialModule04:
            hasher.combine(self.hashValue)
        case .materialModule05:
            hasher.combine(self.hashValue)
        case .materialModule06:
            hasher.combine(self.hashValue)
        case .news:
            hasher.combine(self.hashValue)
        case .glossary:
            hasher.combine(self.hashValue)
        case .searchGlossary:
            hasher.combine(self.hashValue)
        case .newsDetails:
            hasher.combine(self.hashValue)
        case .transactionStatus:
            hasher.combine(self.hashValue)
        case .moduleCompletion:
            hasher.combine(self.hashValue)
        case .reusableMaterialModule:
            hasher.combine(self.hashValue)
        }
    }
    
    // Conform to Equatable
    static func == (lhs: Screen, rhs: Screen) -> Bool {
        switch (lhs, rhs) {
        case (.debug, .debug),
            (.onboarding, .onboarding),
            (.simulationBuyingConfirmation, .simulationBuyingConfirmation),
            (.simulationSellingConfirmation, .simulationSellingConfirmation),
            (.profile, .profile),
            (.main, .main),
            (.materialModule01, .materialModule01),
            (.materialModule02, .materialModule02),
            (.materialModule03, .materialModule03),
            (.materialModule04, .materialModule04),
            (.materialModule05, .materialModule05),
            (.materialModule06, .materialModule06),
            (.news, .news),
            (.glossary, .glossary),
            (.searchGlossary, .searchGlossary),
            (.newsDetails, .newsDetails),
            (.transactionStatus, .transactionStatus),
            (.moduleCompletion, .moduleCompletion),
            (.reusableMaterialModule, .reusableMaterialModule):
            return true
        default:
            return false
        }
    }
}

