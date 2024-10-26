//
//  HanvestProgressBar.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 09/10/24.
//

import SwiftUI

struct HanvestProgressBar: View {
    @Binding var value: Int
    var minimum: Int
    var maximum: Int
    
    func calculateProgressPercentage() -> CGFloat {
        guard maximum > minimum else { return 0 }
        
        let percentage = CGFloat(value - minimum) / CGFloat(maximum - minimum)
        return min(max(percentage, 0), 1)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 100)
                    .frame(height: 14)
                    .foregroundStyle(.fillSecondary)
                
                RoundedRectangle(cornerRadius: 100)
                    .frame(width: geometry.size.width * calculateProgressPercentage(), height: 14)
                    .foregroundStyle(.seagull400)
                    .animation(.easeInOut, value: value)
            }
        }
        .frame(height: 14)
    }
}

#Preview {
    @Previewable @State var value = 10
    
    VStack {
        HanvestProgressBar(value: $value, minimum: 0, maximum: 100)
    }
    .padding(.horizontal, 24)
}

