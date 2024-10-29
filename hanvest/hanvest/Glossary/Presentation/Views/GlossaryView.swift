//
//  GlossaryView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 16/10/24.
//

import SwiftUI

struct GlossaryView: View {
    let router: any AppRouterProtocol
    
    @StateObject private var viewModel = GlossaryViewModel()
    @State private var isPressed = false
    
    var body: some View {
        VStack {
            HanvestNavigationBar(
                label: "Glossary",
                leadingIcon: Image(systemName: "chevron.left"),
                leadingAction: {
                    router.pop()
                },
                trailingIcon: Image(systemName: "magnifyingglass"),
                trailingAction: {
                    router.push(
                        .searchGlossary(glossaryViewModel: viewModel)
                    )
                }
            )
            
            HanvestGlossaryListComponent(viewModel: viewModel)
                .onChange(of: viewModel.selectedEntity) { oldEntity, newEntity in
                    if let entity = newEntity {
                        router.presentOverlay(
                            .withGlossaryPopup(
                                title: entity.word,
                                desc: entity.description,
                                buttonAction: {
                                    viewModel.clearSelection()
                                }
                            )
                        )
                    }
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
