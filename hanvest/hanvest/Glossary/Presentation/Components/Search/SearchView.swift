//
//  SearchView.swift
//  hanvest
//
//  Created by Christian Gunawan on 17/10/24.
//
import SwiftUI

struct SearchView: View {
  let router: any AppRouterProtocol
  @ObservedObject var viewModel: SearchViewModel

  var body: some View {
    VStack {
      SearchTextFieldGlossary(searchString: $viewModel.searchString)

      ScrollView {
        VStack(alignment: .leading) {
          if viewModel.searchString.isEmpty {
            Text("Recent")
              .font(.body)
              .fontWeight(.bold)
              .frame(maxWidth: .infinity, alignment: .leading)
            Divider()

            ForEach(viewModel.recentSearches, id: \.word) { entity in
              HanvestGlossaryWordRow(entity: entity) { selectedEntity in
                print("\(selectedEntity.word) clicked: \(selectedEntity.description)")
              }
            }
          } else {
            ForEach(viewModel.filteredResults, id: \.word) { entity in
              HanvestGlossaryWordRow(entity: entity) { selectedEntity in
                print("\(selectedEntity.word) clicked: \(selectedEntity.description)")
                viewModel.addToRecentSearches(selectedEntity)
              }
            }
          }
        }
        .padding()
      }
    }
    .toolbar {
      ToolbarItem(placement: .topBarLeading) {
        Button {
          router.pop()
        } label: {
          Image(systemName: "chevron.left")
            .foregroundStyle(.labelPrimary)
        }
      }
    }
  }
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .searchGlossary

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
