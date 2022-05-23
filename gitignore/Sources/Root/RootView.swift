import SwiftUI
import ComposableArchitecture

struct RootView: View {
    let store: Store<RootState, RootAction>
    
    init(store: Store<RootState, RootAction>){
        self.store = store
    }
    
    var body: some View {
        SwitchStore(self.store){
            CaseLet(state: /RootState.tabBar, action: RootAction.tabBarAction) { store in
                TabbarView(store: store)
            }
        }
    }
}
