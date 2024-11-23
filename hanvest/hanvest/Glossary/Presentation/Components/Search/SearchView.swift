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
        VStack(spacing: 24) {
            SearchTextFieldGlossary(
                router: router,
                searchString: $searchViewModel.searchString
            )
            
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
                                //                                debugPrint("\(selectedEntity.word) clicked: \(selectedEntity.description)")
                                glossaryViewModel.selectEntity(selectedEntity)
                            }
                        }
                    } else {
                        ForEach(searchViewModel.filteredResults, id: \.word) { entity in
                            HanvestGlossaryWordRow(entity: entity) { selectedEntity in
                                glossaryViewModel.selectEntity(selectedEntity)
                                searchViewModel.addToRecentSearches(selectedEntity)
                            }
                            
                        }
                        
                        
                    }
                }
                .padding(.horizontal, 4)
            }
        }
        .padding(.horizontal, 20)
        .onAppear() {
            searchViewModel.setup(viewModel: glossaryViewModel)
        }
        .onChange(of: glossaryViewModel.selectedEntity) { oldEntity, newEntity in
            if let entity = newEntity {
                router.presentOverlay(
                    .withGlossaryPopup(
                        title: entity.word,
                        desc: entity.description,
                        buttonAction: {
                            glossaryViewModel.clearSelection()
                        }
                    )
                )
            }
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
        }
    }
    .overlay {
        if let popup = appRouter.popup {
            ZStack {
                appRouter.build(popup)
            }
            
        }
    }
}
