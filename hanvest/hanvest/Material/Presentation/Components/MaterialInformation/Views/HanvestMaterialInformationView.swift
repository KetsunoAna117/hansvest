//
//  HanvestMaterialnformationView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

struct HanvestMaterialnformationView: View {
    // Constants
    let title: Text
    let detailText: Text
    
    // Component Contents
    var image: [Image]?
    var bulletPoints: [String]?
    var numberedList: [String]?
    
    var body: some View {
        VStack(spacing: 24) {
            title
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
            
            if let images = image {
                HanvestAutoSpacingImageView(images: images)
            }
            
            ScrollView {
                VStack(spacing: 0) {
                    if let numberedList = numberedList {
                        detailText
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        StockRegulatorModuleNumberedListsView(numberedLists: numberedList)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    } else {
                        if let bulletPoints = bulletPoints {
                            Text("Explanation:")
                                .font(.nunito(.callout, .bold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            RiskAndReturnModuleBulletPointList(bulletPoints: bulletPoints)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        detailText
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }.scrollBounceBehavior(.basedOnSize, axes: [.vertical])
            
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    @Previewable let title = "Preview title"
    @Previewable let detailText = "Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd"
    @Previewable let bulletPoint = ["Preview bullet point 1", "Preview bullet point 2"]
    
    HanvestMaterialnformationView(
        title: Text(title).font(.nunito(.title2)),
        detailText: Text(detailText).font(.callout),
        image: [Image("high-risk-low-risk-triangle")],
        bulletPoints: bulletPoint
    )
    .padding(.horizontal, 20)
}
