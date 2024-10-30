import SwiftUI

class GlossaryViewModel: ObservableObject {
    @Published var selectedEntity: HanvestGlosaryEntities?
    @Published var letters: [String: [HanvestGlosaryEntities]] = [
        "A": [
            HanvestGlosaryEntities(
                word: "Arbitrage",
                description: "Taking advantage of price differences in different markets."),
            HanvestGlosaryEntities(
                word: "Assets",
                description: "Resources owned by a business."),
        ],
        "B": [
            HanvestGlosaryEntities(
                word: "Bearish",
                description: "Market trend indicating decline."),
            HanvestGlosaryEntities(
                word: "Blue Chip",
                description: "High-quality, established companies."),
            HanvestGlosaryEntities(
                word: "Bond",
                description:
                    "Fixed income instrument that represents a loan made by an investor to a borrower."),
        ],
        "C": [
            HanvestGlosaryEntities(
                word: "Capital Gain",
                description: "Profit from the sale of an asset."),
            HanvestGlosaryEntities(
                word: "Cash Flow",
                description: "The net amount of cash being transferred in and out."),
            HanvestGlosaryEntities(
                word: "Common Stock",
                description: "Shares that represent ownership in a company."),
        ],
        "D": [
            HanvestGlosaryEntities(
                word: "Dividend",
                description: "Payment made by a corporation to its shareholders."),
            HanvestGlosaryEntities(
                word: "Debt Securities",
                description:
                    "Financial instruments that represent a loan made by an investor to a borrower."),
        ],
        "E": [
            HanvestGlosaryEntities(
                word: "Equity",
                description: "The value of shares issued by a company."),
            HanvestGlosaryEntities(
                word: "Exchange-Traded Fund (ETF)",
                description: "A type of fund that owns underlying assets and divides ownership into shares."
            ),
        ],
        "F": [
            HanvestGlosaryEntities(
                word: "Financial Statements",
                description: "Formal records of the financial activities of a business."),
            HanvestGlosaryEntities(
                word: "Futures",
                description: "Contracts to buy or sell an asset at a predetermined future date."),
        ],
        "G": [
            HanvestGlosaryEntities(
                word: "Gross Margin",
                description: "Revenue minus the cost of goods sold."),
            HanvestGlosaryEntities(
                word: "Growth Stock",
                description: "Stock in a company that is expected to grow at an above-average rate."),
        ],
        "H": [
            HanvestGlosaryEntities(
                word: "Hedge Fund",
                description: "An investment fund that employs various strategies to earn active returns."),
            HanvestGlosaryEntities(
                word: "Holding Period",
                description: "The duration of time an investor holds an asset."),
        ],
        "I": [
            HanvestGlosaryEntities(
                word: "Index",
                description: "A statistical measure of the changes in a portfolio of stocks."
            ),
            HanvestGlosaryEntities(
                word: "Initial Public Offering (IPO)",
                description: "The first sale of stock by a private company to the public."),
        ],
        "J": [
            HanvestGlosaryEntities(
                word: "Joint Venture",
                description:
                    "A business arrangement in which two or more parties agree to pool their resources."),
            HanvestGlosaryEntities(
                word: "Junk Bonds",
                description: "Bonds rated below investment grade and carry a higher risk of default."),
        ],
        "K": [
            HanvestGlosaryEntities(
                word: "Market Capitalization",
                description: "The total market value of a company's outstanding shares."),
            HanvestGlosaryEntities(
                word: "Key Performance Indicators (KPIs)",
                description:
                    "Measurable values that demonstrate how effectively a company is achieving key business objectives."
            ),
        ],
        "L": [
            HanvestGlosaryEntities(
                word: "Liquidity",
                description: "The ease with which an asset can be converted into cash."),
            HanvestGlosaryEntities(
                word: "Long Position",
                description: "Buying a stock with the expectation that it will rise in value."),
        ],
        "M": [
            HanvestGlosaryEntities(
                word: "Market Order",
                description: "An order to buy or sell a stock at the current market price."),
            HanvestGlosaryEntities(
                word: "Margin",
                description:
                    "The difference between the total value of securities held in an investor's account and the loan amount."
            ),
        ],
        "N": [
            HanvestGlosaryEntities(
                word: "Net Income",
                description: "Total revenue minus total expenses, taxes, and costs."),
            HanvestGlosaryEntities(
                word: "Negotiated Price",
                description: "A price determined through discussion between buyer and seller."),
        ],
        "O": [
            HanvestGlosaryEntities(
                word: "Option",
                description:
                    "A financial derivative that represents a contract sold by one party to another."),
            HanvestGlosaryEntities(
                word: "Over-the-Counter (OTC)",
                description: "Trading that occurs directly between two parties without a central exchange."),
        ],
        "P": [
            HanvestGlosaryEntities(
                word: "Portfolio",
                description: "A collection of financial assets such as stocks, bonds, commodities, etc."),
            HanvestGlosaryEntities(
                word: "P/E Ratio",
                description:
                    "Price-to-earnings ratio; a valuation ratio of a company's current share price compared to its per-share earnings."
            ),
        ],
        "Q": [
            HanvestGlosaryEntities(
                word: "Quarterly Report",
                description:
                    "A financial report that summarizes a company's performance for a specific quarter."),
            HanvestGlosaryEntities(
                word: "Quorum",
                description: "The minimum number of members required to conduct business in a meeting."),
        ],
        "R": [
            HanvestGlosaryEntities(
                word: "Return on Investment (ROI)",
                description: "A measure of the profitability of an investment."),
            HanvestGlosaryEntities(
                word: "Risk Management",
                description: "The identification, assessment, and prioritization of risks."),
        ],
        "S": [
            HanvestGlosaryEntities(
                word: "Securities",
                description:
                    "Financial instruments that represent an ownership position or a creditor relationship."),
            HanvestGlosaryEntities(
                word: "Stock Split",
                description:
                    "A corporate action that increases the number of outstanding shares by splitting existing shares."
            ),
        ],
        "T": [
            HanvestGlosaryEntities(
                word: "Technical Analysis",
                description:
                    "An analysis methodology for forecasting the direction of prices through the study of past market data."
            ),
            HanvestGlosaryEntities(
                word: "Ticker Symbol",
                description:
                    "A unique series of letters representing a particular publicly-traded company's stock."),
        ],
        "U": [
            HanvestGlosaryEntities(
                word: "Underwriting",
                description:
                    "The process by which an underwriter assesses the risk of insuring a home or business."),
            HanvestGlosaryEntities(
                word: "Unit Investment Trust (UIT)",
                description: "An investment fund that holds a fixed portfolio of securities."),
        ],
        "V": [
            HanvestGlosaryEntities(
                word: "Volatility",
                description:
                    "A statistical measure of the dispersion of returns for a given security or market index."
            ),
            HanvestGlosaryEntities(
                word: "Value Stock",
                description: "A stock that is trading for less than its intrinsic value."),
        ],
        "W": [
            HanvestGlosaryEntities(
                word: "Warrant",
                description:
                    "A security that gives the holder the right to purchase the underlying stock at a specified price."
            ),
            HanvestGlosaryEntities(
                word: "Write-Off",
                description: "The reduction of the recorded value of an asset to zero."),
        ],
        "X": [
            HanvestGlosaryEntities(
                word: "XETRA",
                description: "An electronic trading system that is used in Germany."),
            HanvestGlosaryEntities(
                word: "Ex-Dividend Date",
                description:
                    "The date on which a stock begins to trade without the value of its next dividend payment."
            ),
        ],
        "Y": [
            HanvestGlosaryEntities(
                word: "Yield",
                description: "The income return on an investment, usually expressed as a percentage."),
            HanvestGlosaryEntities(
                word: "Year-to-Date (YTD)",
                description:
                    "The period beginning the first day of the current calendar year up to the current date."),
        ],
        "Z": [],
    ]
    
    var alphabet: [String] {
        return letters.keys.sorted()
    }
    
    func selectEntity(_ entity: HanvestGlosaryEntities) {
            selectedEntity = entity
        }
    
    func clearSelection() {
            selectedEntity = nil
        }
}
