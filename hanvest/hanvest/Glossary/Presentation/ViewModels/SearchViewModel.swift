//
//  SearchViewModel.swift
//  hanvest
//
//  Created by Christian Gunawan on 17/10/24.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var searchString: String = "" {
        didSet {
            search()
        }
    }
    
    @Published var filteredResults: [HanvestGlosaryEntities]
    @Published var recentSearches: [HanvestGlosaryEntities]

    private var viewModel: GlossaryViewModel?
    private var allEntities: [HanvestGlosaryEntities]
    
    private let recentSearchLimit = 10
    
    init() {
        self.filteredResults = []
        self.recentSearches = []
        self.allEntities = []
    }
    
    func setup(viewModel: GlossaryViewModel){
        self.viewModel = viewModel
        self.allEntities = viewModel.letters.values.flatMap({ $0 })
        self.filteredResults = allEntities
    }
    
    func search() {
        if searchString.isEmpty {
            filteredResults = allEntities // Display all items or recent searches if desired
        } else {
            filteredResults = allEntities.filter { $0.word.lowercased().contains(searchString.lowercased()) }
        }
    }

    func addToRecentSearches(_ entity: HanvestGlosaryEntities) {
        if !recentSearches.contains(where: { $0.word == entity.word }) {
            recentSearches.insert(entity, at: 0)
            if recentSearches.count > recentSearchLimit {
                recentSearches.removeLast()
            }
        }
    }

    func cancelSearch() {
        searchString = ""
        filteredResults = allEntities
    }
}
