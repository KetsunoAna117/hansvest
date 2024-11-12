//
//  Module02HeaderWithDetailText.swift
//  hanvest
//
//  Created by Bryan Vernanda on 16/10/24.
//

import SwiftUI

enum LiabilitiesVsAssetModuleHeaderWithDetailTextPageContent: Int, CaseIterable {
    case page08 = 7
    case page09 = 8
    case page10 = 9
    
    func title(chosenPhone: String, chosenMethod: String) -> Text {
        switch self {
            case .page08:
                Text("Congratulation!\n").font(.nunito(.title2, .bold)) + assetOrLiabilitiesTitle(chosenPhone: chosenPhone, chosenMethod: chosenMethod)
            case .page09:
                Text("What if?\n").font(.nunito(.title2, .bold)) + assetOrLiabilitiesTitle(chosenPhone: chosenPhone, chosenMethod: reverseMethod(chosenMethod: chosenMethod))
            case .page10:
                Text("In summary\n").font(.nunito(.title2, .bold)) + Text("Liabilities vs Assets").font(.nunito(.title2))
        }
    }
    
    func detailText(chosenPhone: String, chosenMethod: String) -> Text {
        switch self {
            case .page08:
                assetOrLiabilitiesDetail(chosenPhone: chosenPhone, chosenMethod: chosenMethod)
            case .page09:
                assetOrLiabilitiesDetail(chosenPhone: chosenPhone, chosenMethod: reverseMethod(chosenMethod: chosenMethod))
            case .page10:
                Text("Understanding assets (anything of value), liabilities (debts), income, and expenses is key to managing personal finances. Assets generate income streams, while liabilities represent financial obligations. A personal balance sheet helps individuals clearly monitor their financial position, showing the difference between what they own (assets) and what they owe (liabilities). Having a healthy balance sheet, where assets exceed liabilities, is one of the foundations of financial success.\n\n").font(.nunito(.callout)) +
                Text("Reference").font(.nunito(.callout, .bold)) +
                Text(": Ross, S. A., Westerfield, R. W., & Jaffe, J. (2013). Corporate Finance. McGraw-Hill Education.").font(.nunito(.callout))
        }
    }
    
    private func reverseMethod(chosenMethod: String) -> String {
        if chosenMethod == LiabilitiesVsAssetModuleMultipleChoicePageContent.page07.options.first {
            if let lastOption = LiabilitiesVsAssetModuleMultipleChoicePageContent.page07.options.last {
                return lastOption
            }
        } else {
            if let firstOption = LiabilitiesVsAssetModuleMultipleChoicePageContent.page07.options.first {
                return firstOption
            }
        }
        
        return chosenMethod
    }
    
    private func assetOrLiabilitiesTitle(chosenPhone: String, chosenMethod: String) -> Text {
        if chosenMethod == LiabilitiesVsAssetModuleMultipleChoicePageContent.page07.options.first {
            return Text("You got your \(normalOrProMax(chosenPhone: chosenPhone)) with your assets").font(.nunito(.title2))
        } else {
            return Text("You got your \(normalOrProMax(chosenPhone: chosenPhone)) with your liabilities").font(.nunito(.title2))
        }
    }
    
    private func assetOrLiabilitiesDetail(chosenPhone: String, chosenMethod: String) -> Text {
        if chosenMethod == LiabilitiesVsAssetModuleMultipleChoicePageContent.page07.options.first {
            return
                Text("If you choose to pay with your ").font(.nunito(.callout)) +
                Text("debit card").font(.nunito(.callout, .bold)) +
                Text(", you're using your own money upfront. The cash is taken from your bank account immediately, and you get the \(normalOrProMax(chosenPhone: chosenPhone)) with no strings attached. There are no future payments or debts to worry about. It's a clear and simple exchange: you trade your cash").font(.nunito(.callout)) +
                Text(" (asset) ").font(.nunito(.callout, .bold)) +
                Text("for the iPhone").font(.nunito(.callout)) +
                Text(" (another asset) ").font(.nunito(.callout, .bold)) +
                Text(", and you're done with the transaction.").font(.nunito(.callout))
        } else {
            return
                Text("If you buy the \(normalOrProMax(chosenPhone: chosenPhone)) using ").font(.nunito(.callout)) +
                Text("Pay Later").font(.nunito(.callout, .bold)) +
                Text(", you’re taking on a ").font(.nunito(.callout)) +
                Text("liability").font(.nunito(.callout, .bold)) +
                Text(". You get the iPhone now, but you owe Amazon the purchase price, which you'll have to repay in installments or by a specific date. Until the debt is fully paid off, this").font(.nunito(.callout)) +
                Text(" liability ").font(.nunito(.callout, .bold)) +
                Text("is hanging over your head. You enjoy the iPhone now, but you're financially tied to making future payments.").font(.nunito(.callout))
        }
    }
    
    private func normalOrProMax(chosenPhone: String) -> String {
        if chosenPhone == LiabilitiesVsAssetModuleMultipleChoicePageContent.page03.options.first {
            return "iPhone 16"
        } else {
            return "iPhone 16 Pro"
        }
    }
}
