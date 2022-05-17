import SwiftUI
import ComposableArchitecture

struct RootView: View {
    let store = Store(
        initialState: AppState(),
        reducer: appReducer,
        environment: AppEnvironmnet(mainQueue: .main)
    )
    
    var body: some View {
        AppView(store: store)
    }
}

struct RootView_Previews: PreviewProvider {
  static var previews: some View {
    RootView()
  }
}
