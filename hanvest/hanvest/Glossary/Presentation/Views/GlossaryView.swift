//
//  GlossaryView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 16/10/24.
//

import SwiftUI

struct GlossaryView: View {
    // Viewmodel dibikin disini semua (StateObject)
    // Abis itu dipassing ke components
    let router: any AppRouterProtocol
    
    @StateObject var glossaryViewModel = GlossaryViewModel()
    @StateObject var searchViewModel = SearchViewModel(viewModel: GlossaryViewModel())
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
                    router.push(.searchGlossary)
                }
            )
            
            HanvestGlossaryListComponent(viewModel: glossaryViewModel)
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
