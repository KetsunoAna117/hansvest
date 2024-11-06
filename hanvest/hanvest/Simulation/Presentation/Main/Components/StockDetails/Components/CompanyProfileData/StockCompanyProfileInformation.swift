//
//  StockCompanyProfileInformation.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 15/10/24.
//

import SwiftUI

struct StockCompanyProfileInformation: View {
    var desc: String
    
    var body: some View {
        HanvestCardBackground {
            VStack(alignment: .leading) {
                Text("Company Profile")
                    .font(.nunito(.body, .bold))
                Text(desc)
                    .font(.nunito(.caption1))
            }
        }
    }
}

#Preview {
    StockCompanyProfileInformation(desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer rhoncus tellus nulla, ut blandit neque rutrum in. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sem lectus, semper a libero ut, congue sodales sem. Ut convallis volutpat ipsum quis maximus.")
}
