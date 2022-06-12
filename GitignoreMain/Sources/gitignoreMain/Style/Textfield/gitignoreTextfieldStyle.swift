import SwiftUI

struct gitignoreTextfieldStyle : TextFieldStyle{
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .textFieldStyle(PlainTextFieldStyle())
            .padding(10)
            .cornerRadius(20)
            .border(Color.orange, width: 2)
            .disableAutocorrection(true)
            .frame(height: 40)
    }
}
 
