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
    case news
    case newsDetails(news: SimulationNewsEntity)
    case glossary
    case profile
    case materialModule01
    case materialModule02
    case materialModule03
    case materialModule04
    case simulationBuyingConfirmation(viewModel: HanvestSimulationViewModel)
    case simulationSellingConfirmation(viewModel: HanvestSimulationViewModel)
    case transactionStatus(transaction: TransactionStatusViewModel)
    case moduleCompletion(completionItem: CompletionEntityType)
    
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
        case .news:
            hasher.combine(self.hashValue)
        case .glossary:
            hasher.combine(self.hashValue)
        case .newsDetails:
            hasher.combine(self.hashValue)
        case .transactionStatus:
            hasher.combine(self.hashValue)
        case .moduleCompletion:
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
            (.news, .news),
            (.glossary, .glossary),
            (.newsDetails, .newsDetails),
            (.transactionStatus, .transactionStatus),
            (.moduleCompletion, .moduleCompletion):
            return true
        default:
            return false
        }
    }
}

