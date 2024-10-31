//
//  HanvestNumberStepper.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 09/10/24.
//

import SwiftUI

struct HanvestNumberStepper: View {
    @Binding var value: Int
    var raise: Int
    
    @StateObject var viewModel = HanvestNumberStepperViewModel()
    
    var body: some View {
        HStack() {
            Button{
                viewModel.decrement(&value, raise)
            } label: {
                Circle()
                    .stroke(.mineShaft200, lineWidth: 1)
                    .frame(width: 28, height: 28)
                    .background(
                        Circle()
                            .fill(.seagull100)
                    )
                    .overlay{
                        Image(systemName: "minus")
                            .frame(width: 17, height: 17)
                            .foregroundColor(.black)
                            .padding()
                    }
                
            }
            
            Text("\(value)")
                .font(.nunito(.body))
                .frame(minWidth: 80, idealWidth: 168) 
                .padding(.horizontal, 20)
                .showCase(
                    order: Module05TipData.lot.index,
                    title: Module05TipData.lot.title,
                    detail: Module05TipData.lot.detail,
                    stage: .buyStage
                )
            
            Button {
                viewModel.increment(&value, raise)
            } label: {
                Circle()
                    .stroke(.mineShaft200, lineWidth: 1)
                    .frame(width: 28, height: 28)
                    .background(
                        Circle()
                            .fill(.seagull100)
                    )
                    .overlay{
                        Image(systemName: "plus")
                            .frame(width: 17, height: 17)
                            .foregroundColor(.black)
                            .padding()
                    }
            }
        }
        .frame(minWidth: 168)
    }
}

#Preview {
    @Previewable @State var value: Int = 10
    let raise = 25
    
    VStack {
        HanvestNumberStepper(value: $value, raise: raise)
            .padding()
    }
    .background(.mineShaft50)
}

