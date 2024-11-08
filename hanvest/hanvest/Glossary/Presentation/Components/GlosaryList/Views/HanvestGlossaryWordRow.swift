//
//  HanvestGlossaryWordRow.swift
//  hanvest
//
//  Created by Christian Gunawan on 16/10/24.
//

import SwiftUI

struct HanvestGlossaryWordRow: View {
    var entity: HanvestGlosaryEntities
    var action: (_ entity: HanvestGlosaryEntities) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            
            Text(entity.word)
                .font(.nunito(.body))
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .topLeading)
            
            Divider()
        }
        .contentShape(Rectangle())
        .onTapGesture {
            action(entity)
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

#Preview {
    HanvestGlossaryWordRow(
        entity: HanvestGlosaryEntities(
            word: "Cash", description: "Cash is the most liquid asset a company can possess.")
    ) { entity in
        debugPrint("\(entity.word) clicked: \(entity.description)")
    }
    
    HanvestGlossaryWordRow(
        entity: HanvestGlosaryEntities(
            word: "Assets", description: "Assets are resources owned by a company.")
    ) { entity in
        debugPrint("\(entity.word) clicked: \(entity.description)")
    }
}
