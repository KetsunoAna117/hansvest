//
//  GetModuleToDisplay.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 20/10/24.
//

protocol GetModuleToDisplay {
    func execute() -> [ModuleNavigatiorEntity]
}

struct GetModuleToDisplayImpl: GetModuleToDisplay {
    let repo: UserRepository
    
    func execute() -> [ModuleNavigatiorEntity] {
        guard let user = repo.fetch() else {
            return []
        }
        
        _ = user.userRiskProfile // TODO: Select Module based on user risk profile
        
        return [
            ModuleNavigatiorEntity(
                moduleID: "basicInvestmentModule",
                moduleScreenID: .materialBasicInvestmentModule,
                state: .next,
                popup: ModulePopupNavigatiorEntity(
                    title: "Basic Investment",
                    desc: """
                            This module uses fun tree analogies to teach investing basics. Discover the importance of patience, care, and potential rewards.
                        """
                ),
                completionEntity: .basicInvestmentModule
            ),
            ModuleNavigatiorEntity(
                moduleID: "liabilitiesVsAssetModule",
                moduleScreenID: .materialLiabilitiesVsAsset,
                state: .next,
                popup: ModulePopupNavigatiorEntity(
                    title: "Liabilities vs Assets",
                    desc: """
                            This module uses simulated shopping to teach the difference between assets and liabilities.
                        """
                ),
                completionEntity: .liabilitiesVsAssetModule
            ),
            ModuleNavigatiorEntity(
                moduleID: "riskAndReturnModule",
                moduleScreenID: .materialRiskAndReturnModule,
                state: .next,
                popup: ModulePopupNavigatiorEntity(
                    title: "Risk and return",
                    desc: """
                            Recognize that different investments have varying risk and reward profiles
                        """
                ),
                completionEntity: .riskAndReturnModule
            ),
            ModuleNavigatiorEntity(
                moduleID: "stockRegulatorModule",
                moduleScreenID: .reusableMaterialModule(
                    material: .init(
                        content: StockRegulatorModuleViewModel.getContent(),
                        completionEntityType: .stockRegulatorModule
                    )
                ),
                state: .next,
                popup: .init(
                    title: "Stock Regulator",
                    desc: "Identify the three key Self-Regulatory Organizations (SROs) in Indonesia's capital market."
                ),
                completionEntity: .stockRegulatorModule
            ),
            ModuleNavigatiorEntity(
                moduleID: "fundamentalModule",
                moduleScreenID: .materialFundamentalModule,
                state: .next,
                popup: ModulePopupNavigatiorEntity(
                    title: "Fundamental Part 1",
                    desc: """
                            Exploring the overview of market and its component
                        """
                ),
                completionEntity: .fundamentalModule
            ),
            ModuleNavigatiorEntity(
                moduleID: "newsModule",
                moduleScreenID: .materialNewsModule,
                state: .next,
                popup: ModulePopupNavigatiorEntity(
                    title: "News",
                    desc: """
                            Learn action to take based on news
                        """
                ),
                completionEntity: .newsModule
            ),
            ModuleNavigatiorEntity(
                moduleID: "sectorModule",
                moduleScreenID: .reusableMaterialModule(
                    material: .init(
                        content: SectorModuleViewModel.getContent(),
                        completionEntityType: .sectorModule
                    )
                ),
                state: .next,
                popup: .init(
                    title: "Sector",
                    desc: "Let’s Learn About Stock Sectors: Imagine a Neighborhood of Businesses!"
                ),
                completionEntity: .sectorModule
            ),
            ModuleNavigatiorEntity(
                moduleID: "macroEconomicsModule",
                moduleScreenID: .reusableMaterialModule(
                    material: .init(
                        content: MacroEconomicsModuleViewModel.getContent(),
                        completionEntityType: .macroEconomicsModule
                    )
                ),
                state: .next,
                popup: .init(
                    title: "MacroEconomics",
                    desc: "The economic cycle is a fluctuating pattern that the economy experiences over time."
                ),
                completionEntity: .macroEconomicsModule
            )
        ]
    }
    
    
}
