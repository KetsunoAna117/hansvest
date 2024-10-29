//
//  HanvestGlossaryRow.swift
//  hanvest
//
//  Created by Christian Gunawan on 16/10/24.
//

import SwiftUI

struct HanvestGlossaryRow: View {
    @ObservedObject var viewModel: GlossaryViewModel
    var letter: String
    var words: [HanvestGlosaryEntities]
    
    var body: some View {
        VStack(alignment: .leading) {
            HanvestGlossaryWordLetterRow(letter: letter)
            ForEach(words, id: \.word) { entry in
                HanvestGlossaryWordRow(entity: entry) { clickedEntity in
                    viewModel.selectEntity(clickedEntity)
                }
            }
        }
        .padding(8)
    }
}

#Preview {
    HanvestGlossaryRow(
        viewModel: GlossaryViewModel(),
        letter: "A",
        words: [
            HanvestGlosaryEntities(word: "Cash", description: "Duit"),
            HanvestGlosaryEntities(word: "Cuy", description: "Cuy"),
        ]
    )
}

#Preview {
    HanvestGlossaryRow(
        viewModel: GlossaryViewModel(),
        letter: "A",
        words: [
            HanvestGlosaryEntities(
                word: "Cash",
                description: "Duit"
            ),
            HanvestGlosaryEntities(
                word: "Cuy",
                description: "Cuy"
            ),
        ]
    )
    
}
