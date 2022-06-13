import SwiftUI

struct TitleLogo: View {
    var body: some View {
        VStack{
            Image("HomeLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 100)
            Text("Create a .gitignore file for your project faster!", bundle:  .module)
                .font(.system(size: 13, weight: .medium, design: .default))
                .padding(.top, 20)
        }
    }
    
}
