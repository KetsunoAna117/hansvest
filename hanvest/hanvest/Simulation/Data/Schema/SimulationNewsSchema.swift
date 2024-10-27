//
//  SimulationNewsSchema.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 21/10/24.
//

import Foundation
import SwiftData

@Model final class SimulationNewsSchema {
    @Attribute(.unique) var newsID: String
    var stockIDName: String
    var newsTitle: String
    var newsReleasedTime: Date
    var newsContent: String
    var stockFluksPercentage: Int
    var hasTriggered: Bool
    
    init(newsID: String, stockIDName: String, newsTitle: String, newsReleasedTime: Date, newsContent: String, stockFluksPercentage: Int, hasTriggered: Bool) {
        self.newsID = newsID
        self.stockIDName = stockIDName
        self.newsTitle = newsTitle
        self.newsReleasedTime = newsReleasedTime
        self.newsContent = newsContent
        self.stockFluksPercentage = stockFluksPercentage
        self.hasTriggered = hasTriggered
    }
    
    func update(_ newData: SimulationNewsSchema) {
        self.newsID = newData.newsID
        self.stockIDName = newData.stockIDName
        self.newsTitle = newData.newsTitle
        self.newsReleasedTime = newData.newsReleasedTime
        self.newsContent = newData.newsContent
        self.stockFluksPercentage = newData.stockFluksPercentage
        self.hasTriggered = newData.hasTriggered
    }
    
    func update(stockIDName: String) {
        self.stockIDName = stockIDName
    }
    
    func update(newsTitle: String) {
        self.newsTitle = newsTitle
    }
    
    func update(newsReleasedTime: Date) {
        self.newsReleasedTime = newsReleasedTime
    }
    
    func update(newsContent: String) {
        self.newsContent = newsContent
    }
    
    func update(stockFluksPercentage: Int) {
        self.stockFluksPercentage = stockFluksPercentage
    }
    
    func mapToEntity() -> SimulationNewsEntity {
        return SimulationNewsEntity(
            newsID: self.newsID,
            stockIDName: self.stockIDName,
            newsTitle: self.newsTitle,
            newsReleasedTime: self.newsReleasedTime,
            newsContent: self.newsContent,
            stockFluksPercentage: self.stockFluksPercentage,
            hasTriggered: hasTriggered
        )
    }
}
