import SwiftUI

struct ToolBarButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
            .buttonStyle(PlainButtonStyle())
    }
    
    //MARK: - Initalizer
     init(){}
}


