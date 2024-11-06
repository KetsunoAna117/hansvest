import SwiftUI

struct HanvestStockOption: View {
    // Constant
    let SHADOW_OFFSET: CGFloat = 5
    let WIDTH: CGFloat = 75
    let HEIGHT: CGFloat = 75
    
    // Bind to the parent selection
    @Binding var selectedStockID: String
    
    @State var state: HanvestStockOptionDefaultState = .unselected
    
    // Button Content
    var id: String
    var imageName: String
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Image(self.state == .unselected ? "\(imageName)-inactive" : "\(imageName)")
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(
                    color: (self.state == .unselected ? .mineShaft700 : .clear),
                    radius: getPressedStatus() ? 0 : 0, x: 0, y: getPressedStatus() ? 0 : SHADOW_OFFSET
                )
        }
        .frame(maxWidth: WIDTH, maxHeight: HEIGHT)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .fill(.clear)
        )
        .offset(y: getPressedStatus() ? SHADOW_OFFSET : 0)
        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: self.state)
        .onTapGesture {
            if selectedStockID != id {
                self.selectedStockID = self.id
                state = .selected
                action()
            }

        }
        .onChange(of: selectedStockID) { oldValue, newValue in
            if newValue != id {
                state = .unselected
            }
        }
    }
    
    func getPressedStatus() -> Bool {
        return state == .selected
    }
    
}

#Preview {
    @Previewable @State var selectedStockOption: String = ""
    
    VStack {
        HanvestStockOption(
            selectedStockID: $selectedStockOption,
            state: .selected,
            id: "Stock-1",
            imageName: "Amazon-logo"
        ) {
            print("Stock-1 selected")
        }
        
        HanvestStockOption(
            selectedStockID: $selectedStockOption,
            state: .unselected,
            id: "Stock-2",
            imageName: "BBRI-logo"
        ) {
            print("Stock-2 selected")
        }
        
        HanvestStockOption(
            selectedStockID: $selectedStockOption,
            state: .unselected,
            id: "Stock-3",
            imageName: "Apple-logo"
        ) {
            print("Stock-3 selected")
        }
        
        HanvestStockOption(
            selectedStockID: $selectedStockOption,
            state: .unselected,
            id: "Stock-4",
            imageName: "BBCA-logo"
        ) {
            print("Stock-4 selected")
        }
        
        HanvestStockOption(
            selectedStockID: $selectedStockOption,
            state: .unselected,
            id: "Stock-5",
            imageName: "GOTO-logo"
        ) {
            print("Stock-5 selected")
        }
    }
}
