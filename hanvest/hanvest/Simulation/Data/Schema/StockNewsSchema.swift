//
//  SimulationNewsSchema.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 21/10/24.
//

import Foundation
import SwiftData

@Model final class StockNewsSchema: Decodable {
    @Attribute(.unique) var newsID: String
    var stockIDName: String
    var newsTitle: String
    var newsContent: String
    var stockFluksPercentage: Int
    
    init(newsID: String, stockIDName: String, newsTitle: String, newsContent: String, stockFluksPercentage: Int) {
        self.newsID = newsID
        self.stockIDName = stockIDName
        self.newsTitle = newsTitle
        self.newsContent = newsContent
        self.stockFluksPercentage = stockFluksPercentage
    }
    
    func update(_ newData: StockNewsSchema) {
        self.newsID = newData.newsID
        self.stockIDName = newData.stockIDName
        self.newsTitle = newData.newsTitle
        self.newsContent = newData.newsContent
        self.stockFluksPercentage = newData.stockFluksPercentage
    }
    
    func update(stockIDName: String) {
        self.stockIDName = stockIDName
    }
    
    func update(newsTitle: String) {
        self.newsTitle = newsTitle
    }
    
    func update(newsContent: String) {
        self.newsContent = newsContent
    }
    
    func update(stockFluksPercentage: Int) {
        self.stockFluksPercentage = stockFluksPercentage
    }
    
    func mapToEntity() -> StockNewsEntity {
        return StockNewsEntity(
            newsID: self.newsID,
            stockIDName: self.stockIDName,
            newsTitle: self.newsTitle,
            newsContent: self.newsContent,
            stockFluksPercentage: self.stockFluksPercentage
        )
    }
    
    // Custom Decodable initializer to handle decoding
      required init(from decoder: Decoder) throws {
          let container = try decoder.container(keyedBy: CodingKeys.self)
          
          // Decode each property individually
          self.newsID = try container.decode(String.self, forKey: .newsID)
          self.stockIDName = try container.decode(String.self, forKey: .stockIDName)
          self.newsTitle = try container.decode(String.self, forKey: .newsTitle)
          self.newsContent = try container.decode(String.self, forKey: .newsContent)
          self.stockFluksPercentage = try container.decode(Int.self, forKey: .stockFluksPercentage)
      }
      
      // Enum for coding keys to match JSON keys to properties
      private enum CodingKeys: String, CodingKey {
          case newsID
          case stockIDName
          case newsTitle
          case newsContent
          case stockFluksPercentage
      }
}
