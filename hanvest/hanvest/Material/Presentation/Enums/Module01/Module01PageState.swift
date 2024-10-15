//
//  Module01PageState.swift
//  hanvest
//
//  Created by Bryan Vernanda on 15/10/24.
//

import SwiftUI

enum Module01PageState {
    case moduleMaterial
    case claimReward
    
    var buttonStringValue: String {
        switch self {
            case .moduleMaterial:
                "Continue"
            case .claimReward:
                "Claim Reward"
        }
    }
    
    var contentOfModuleMaterial: [(headerText: Text, detailText: Text)]? {
        switch self {
            case .moduleMaterial:
                [
                    (
                        Text("So, what is investment?").font(.nunito(.title2)),
                        Text("Investing is like putting your money to work over time to earn more money in the future. It involves using resources, usually money, with the hope of making a profit or gaining something later on.\n\nYou can think of it like planting a tree. You put in time, effort, and care (like planting seeds and watering them). With patience, the tree grows and eventually gives you fruit, which represents the profits from your investment. Just like the tree, investments take time to grow before they start paying off.\n\n").font(.nunito(.callout)) +
                        Text("Reference").font(.nunito(.callout, .bold)) +
                        Text(": Graham, B., & Zweig, J. (2006). The Intelligent Investor. Harper Business.").font(.nunito(.callout))
                    ),
                    (
                        Text("So, why invest?").font(.nunito(.title2)),
                        Text("Investing is important to achieve various financial goals. Short-term goals may include buying a vehicle or going on vacation, while long-term goals often involve preparing for retirement funds or children's education. Investment allows funds to grow over time through capital gains or dividends, offering higher returns compared to simply keeping money in a regular savings account. With the right investment strategy, risks can also be managed to achieve the desired objectives.\n\n").font(.nunito(.callout)) +
                        Text("Reference").font(.nunito(.callout, .bold)) +
                        Text(": Bodie, Z., Kane, A., & Marcus, A. J. (2014). Essentials of Investments. McGraw-Hill Education.").font(.nunito(.callout))
                    )
                ]
            case .claimReward:
                nil
        }
    }
}
