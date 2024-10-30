//  GlosaryList.swift
//  hanvest
//
//  Created by Christian Gunawan on 16/10/24.
//

import SwiftUI

struct HanvestGlossaryListComponent: View {
    @ObservedObject var viewModel: GlossaryViewModel
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.alphabet, id: \.self) { letter in
                if let words = viewModel.letters[letter], !words.isEmpty {
                    HanvestGlossaryRow(
                        viewModel: viewModel,
                        letter: letter,
                        words: words
                    )
                }
            }
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var viewmodel = GlossaryViewModel()
    HanvestGlossaryListComponent(viewModel: viewmodel)
}
