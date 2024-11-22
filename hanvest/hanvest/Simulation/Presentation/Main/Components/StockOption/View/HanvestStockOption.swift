import SwiftUI

struct HanvestStockOption: View {
    // Bind to the parent selection
    @Binding var selectedStockID: String
    
    // Styling variable (initialized before)
    @State private var style: HanvestStockOptionButtonStyle = .defaultColor
    
    // Button Content
    var id: String
    var imageName: String
    var action: () -> Void
    
    var body: some View {
        Button(
            action: {
                HanvestSoundFXManager.playSound(soundFX: HanvestSoundFX.click)
                HanvestHapticManager.hapticNotif(type: .success)

                if self.selectedStockID != self.id {
                    self.selectedStockID = self.id
                    action()
                }
                
            }, label: {
                ZStack {
                    Image(self.selectedStockID == self.id ? "\(imageName)_ACTIVE" : "\(imageName)_INACTIVE")
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
        )
        .buttonStyle(HanvestStockOptionButtonType(style: style))
        .onChange(of: selectedStockID) { _, newValue in
            setStockOptionButtonShadowColor()
        }
        .onAppear {
            setStockOptionButtonShadowColor()
        }
    }
    
    private func setStockOptionButtonShadowColor() {
        if (self.selectedStockID == self.id) {
            self.style = HanvestStockOptionButtonStyle.allCases.first(where: { $0.stockName == imageName }) ?? .defaultColor
        } else {
            self.style = .defaultColor
        }
    }
    
}

#Preview {
    @Previewable @State var selectedStockOption: String = ""
    
    VStack {
        HanvestStockOption(
            selectedStockID: $selectedStockOption,
            id: "Stock-1",
            imageName: "Amazon-logo"
        ) {
            debugPrint("Stock-1 selected")
        }
        
        HanvestStockOption(
            selectedStockID: $selectedStockOption,
            id: "Stock-2",
            imageName: "BBRI-logo"
        ) {
            debugPrint("Stock-2 selected")
        }
        
        HanvestStockOption(
            selectedStockID: $selectedStockOption,
            id: "Stock-3",
            imageName: "Apple-logo"
        ) {
            debugPrint("Stock-3 selected")
        }
        
        HanvestStockOption(
            selectedStockID: $selectedStockOption,
            id: "Stock-4",
            imageName: "BBCA-logo"
        ) {
            debugPrint("Stock-4 selected")
        }
        
        HanvestStockOption(
            selectedStockID: $selectedStockOption,
            id: "Stock-5",
            imageName: "GOTO-logo"
        ) {
            debugPrint("Stock-5 selected")
        }
    }
}
