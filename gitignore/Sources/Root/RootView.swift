import SwiftUI
import ComposableArchitecture

struct RootView: View {
    let store = Store(
        initialState: RootState(),
        reducer: rootReducer,
        environment: RootEnvironment()
    )
    
    var body: some View {
        WithViewStore(store.self){ viewStore in
            MainView(store: self.store.scope(
                state: \.mainState,
                action: RootAction.mainAction
            ))
            .frame(minWidth: 700, minHeight: 500)
            .ignoresSafeArea(.all, edges: .all)
        }
    }
}
