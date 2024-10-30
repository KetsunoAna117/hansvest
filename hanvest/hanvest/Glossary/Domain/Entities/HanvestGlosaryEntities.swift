//
//  HanvestGlosaryRowDescription.swift
//  hanvest
//
//  Created by Christian Gunawan on 16/10/24.
//

class HanvestGlosaryEntities:Identifiable, Equatable{
    let word: String
    let description: String
    
    init(word: String, description: String) {
        self.word = word
        self.description = description
    }
    
    static func == (lhs: HanvestGlosaryEntities, rhs: HanvestGlosaryEntities) -> Bool {
        return lhs.word == rhs.word && lhs.description == rhs.description
    }
}
