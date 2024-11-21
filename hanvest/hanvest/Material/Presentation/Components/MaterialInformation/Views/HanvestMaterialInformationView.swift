//
//  HanvestMaterialInformationView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

struct HanvestMaterialInformationView: View {
    // Constants
    let title: Text
    let detailText: Text
    
    // Component Contents
    var imageNames: [String]?
    var pointListStyle: HanvestPointListStyle?
    var pointListContents: [String]?
    
    var body: some View {
        VStack(spacing: 24) {
            title
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
            
            if let imageNames = imageNames {
                HanvestAutoSpacingImageView(imageNames: imageNames)
            }
            
            ScrollView {
                VStack(spacing: 0) {
                    if let pointListStyle = pointListStyle, pointListStyle == .bulleted {
                        Text("Explanation:")
                            .font(.nunito(.callout, .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    } else {
                        detailText
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    if let pointListContents = pointListContents, let pointListStyle = pointListStyle {
                        HanvestPointListView(pointListContents: pointListContents, pointListStyle: pointListStyle)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    if let pointListStyle = pointListStyle, pointListStyle == .bulleted {
                        detailText
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }.scrollBounceBehavior(.basedOnSize, axes: [.vertical])
            
        }
        .frame(maxWidth: .infinity)
        .accessibilityElement(children: .contain)
        .accessibilityLabel("\(title) material information")
    }
}

#Preview {
    @Previewable let title = "Preview title"
    @Previewable let detailText = "Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd"
    @Previewable let bulletPoint = ["Preview bullet point 1", "Preview bullet point 2"]

    HanvestMaterialInformationView(
        title: Text(title).font(.nunito(.title2)),
        detailText: Text(detailText).font(.callout),
        pointListStyle: .bulleted,
        pointListContents: bulletPoint
    )
    .padding(.horizontal, 20)
}
