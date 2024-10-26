//
//  SearchView.swift
//  hanvest
//
//  Created by Christian Gunawan on 17/10/24.
//
import SwiftUI

struct SearchView: View {
    let router: any AppRouterProtocol
    
    @ObservedObject var glossaryViewModel: GlossaryViewModel
    @StateObject private var searchViewModel: SearchViewModel = .init()
    
    var body: some View {
        VStack {
            SearchTextFieldGlossary(searchString: $searchViewModel.searchString)
            
            ScrollView {
                VStack(alignment: .leading) {
                    if searchViewModel.searchString.isEmpty {
                        Text("Recent")
                            .font(.body)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Divider()
                        
                        ForEach(searchViewModel.recentSearches, id: \.word) { entity in
                            HanvestGlossaryWordRow(entity: entity) { selectedEntity in
                                print("\(selectedEntity.word) clicked: \(selectedEntity.description)")
                            }
                        }
                    } else {
                        ForEach(searchViewModel.filteredResults, id: \.word) { entity in
                            HanvestGlossaryWordRow(entity: entity) { selectedEntity in
                                print("\(selectedEntity.word) clicked: \(selectedEntity.description)")
                                searchViewModel.addToRecentSearches(selectedEntity)
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .onAppear() {
            searchViewModel.setup(viewModel: glossaryViewModel)
        }
    }
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .glossary
    
    NavigationStack(path: $appRouter.path) {
        if let startScreen = startScreen {
            appRouter.build(startScreen)
                .navigationDestination(for: Screen.self) { screen in
                    appRouter.build(screen)
                }
                .overlay {
                    if let popup = appRouter.popup {
                        ZStack {
                            appRouter.build(popup)
                        }
                        
                    }
                }
        }
    }
}
