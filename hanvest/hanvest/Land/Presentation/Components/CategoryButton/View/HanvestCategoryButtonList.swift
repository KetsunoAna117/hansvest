//
//  HanvestCategoryButtonList.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 17/10/24.
//

import SwiftUI

struct HanvestCategoryButtonList: View {
    @Binding var selectedStockID: String
    
    var landCategoryButtonList: [LandCategoryButtonEntity]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(landCategoryButtonList, id: \.buttonIDName) { value in
                        HanvestCategoryButton(
                            selectedStockID: $selectedStockID,
                            initialState: self.selectedStockID == value.buttonIDName ? .selected : .unselected,
                            id: value.buttonIDName,
                            imageName: value.buttonImageName
                        ) {
                            debugPrint("\(value.buttonIDName) is pressed")
                        }
                        .padding(.bottom, 6)
                    }
                }
            }
            .safeAreaPadding(.horizontal, 20)
        }
        .padding(.vertical, 12)
    }
}

#Preview {
    @Previewable @State var selectedStockID: String = "Star"
    
    HanvestCategoryButtonList(
        selectedStockID: $selectedStockID,
        landCategoryButtonList: LandCategoryButtonEntity.getMockData()
    )
}
