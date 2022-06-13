import SwiftUI
import ComposableArchitecture

struct RootView: View {
    let store = Store(
        initialState: RootState(),
        reducer: rootReducer,
        environment: RootEnvironment()
    )
    
    var body: some View {
        SwitchStore(self.store){
            CaseLet(state: /RootState.tabBar, action: RootAction.tabBarAction) { store in
                TabbarView(store: store)
            }
        }
    }
}
