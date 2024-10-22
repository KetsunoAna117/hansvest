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
                moduleID: "module01",
                moduleScreenID: .materialModule01,
                state: .next,
                popup: ModulePopupNavigatiorEntity(
                    title: "Basic Investment",
                    desc: """
                            This module uses fun tree analogies to teach investing basics. Discover the importance of patience, care, and potential rewards.
                        """
                )
            ),
            ModuleNavigatiorEntity(
                moduleID: "module02",
                moduleScreenID: .materialModule02,
                state: .next,
                popup: ModulePopupNavigatiorEntity(
                    title: "Liabilities vs Assets",
                    desc: """
                            This module uses simulated shopping to teach the difference between assets and liabilities.
                        """
                )
            ),
            ModuleNavigatiorEntity(
                moduleID: "module03",
                moduleScreenID: .materialModule03,
                state: .next,
                popup: ModulePopupNavigatiorEntity(
                    title: "Risk and return",
                    desc: """
                            Recognize that different investments have varying risk and reward profiles
                        """
                )
            ),
            ModuleNavigatiorEntity(
                moduleID: "module04",
                moduleScreenID: .materialModule04,
                state: .next,
                popup: ModulePopupNavigatiorEntity(
                    title: "Stock Regulator",
                    desc: """
                            Identify the three key Self-Regulatory Organizations (SROs) in Indonesia's capital market.
                        """
                )
            ),
            ModuleNavigatiorEntity(
                moduleID: "module05",
                moduleScreenID: .main,
                state: .next,
                popup: ModulePopupNavigatiorEntity(
                    title: "Fundamental Part 1",
                    desc: """
                            Exploring the overview of market and its component
                        """
                )
            ),
            ModuleNavigatiorEntity(
                moduleID: "module06",
                moduleScreenID: .main,
                state: .next,
                popup: ModulePopupNavigatiorEntity(
                    title: "News",
                    desc: """
                            Learn action to take based on news
                        """
                )
            )
        ]
    }
    
    
}
