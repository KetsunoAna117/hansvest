//
//  SearchTextFieldGlossary.swift
//  hanvest
//
//  Created by Christian Gunawan on 25/10/24.
//

import SwiftUI

struct SearchTextFieldGlossary: View {
    let router: any AppRouterProtocol
    @Binding var searchString: String
    
    var body: some View {
        
        HStack(alignment:.center){
            Spacer()
            TextField("Search", text: $searchString)
                .padding(8)
                .background(Color.fillTertiary)
                .cornerRadius(10)
            
            Button(action: {
                searchString = ""
                self.router.pop()
            }) {
                
                Image(systemName: "x.circle.fill")
                    .resizable()
                    .accentColor(Color.secondary)
                    .frame(width: 26,height: 26)
            }
            Spacer()
        }
    }
}
