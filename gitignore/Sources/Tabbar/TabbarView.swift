import SwiftUI
import ComposableArchitecture
import gitignoreView
import gitignoreList
import gitignoreMain

//MARK: - Screen

struct TabbarView: View {
    let store: Store<TabBarState, TabBarAction>
    
    public init(store: Store<TabBarState, TabBarAction>) {
      self.store = store
    }
    
    var body: some View {
        WithViewStore(self.store){ viewStore in
            HStack{
                VStack{
                    TabButton(image: "house.fill", title: "Home", store: store)
                    TabButton(image: "note.text", title: "List", store: store)
                    Spacer()
                }
                .padding()
                .padding(.top,35)
                .background(BlurView())
                ZStack{
                    switch viewStore.selectedTab{
                    case "Home": MainView(store: self.store.scope(
                        state: \.mainState,
                        action: TabBarAction.mainAction
                    ))
                    case "List": ListView(store: self.store.scope(
                        state: \.listState,
                        action: TabBarAction.listAction
                    ))
                    default: Text("")
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .ignoresSafeArea(.all, edges: .all)
            .frame( minWidth: 700,minHeight: 500)
        }
    }
}
