//
//  HanvestNavigationBar.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 17/10/24.
//

import SwiftUI

struct HanvestNavigationBar: View {
    // Constant
    let LABEL_MAX_WIDTH: CGFloat = 180
    let ICON_PADDING: CGFloat = 28
    
    var label: String
    
    var leadingIcon: Image?
    var leadingAction: (() -> ())?
    
    var trailingIcon: Image?
    var trailingAction: (() -> ())?
    
    var body: some View {
        VStack {
            ZStack() {
                Text(label)
                    .font(.nunito(.title3))
                    .frame(maxWidth: LABEL_MAX_WIDTH, alignment: .center)
                    .padding(.top, 15)
                    .padding(.bottom, 9)
                
                HStack {
                    if let leadingIcon = leadingIcon {
                        Button {
                            if let leadingAction = leadingAction {
                                leadingAction()
                            }
                        } label: {
                            leadingIcon
                                .imageScale(.large)
                        }
                        .foregroundStyle(Color.black)
                    }
                    
                    Spacer()
                    
                    if let trailingIcon = trailingIcon {
                        Button {
                            if let trailingAction = trailingAction {
                                trailingAction()
                            }
                        } label: {
                            trailingIcon
                                .imageScale(.large)
                        }
                        .foregroundStyle(Color.black)

                    }
                }
                .padding(.horizontal, ICON_PADDING)
            }
            .frame(maxWidth: .infinity)
            .background(
                Rectangle()
                    .fill(Color.background)
                    .shadow(color: Color.black.opacity(0.1), radius: 0, x: 0, y: 1)
            )
        }
        
    }
}

#Preview {
    VStack {
        HanvestNavigationBar(
            label: "Hello, World!",
            leadingIcon: Image(systemName: "chevron.left"),
            leadingAction: {
                debugPrint("Leading Icon Pressed")
            },
            trailingIcon: Image(systemName: "magnifyingglass"),
            trailingAction: {
                debugPrint("Trailing Icon Pressed")
            }
        )
        
        Text("Hello World!")
        Spacer()
    }
}
