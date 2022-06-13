import SwiftUI
import ComposableArchitecture
import UIUtil
import FoundationUtil

public struct ListView: View {
    let store : Store<ListState,ListAction>

    public init(store : Store<ListState,ListAction>){
        self.store = store
    }
    
    public var body: some View {
        Color.backgroundColor
        .ignoresSafeArea()
        .padding(.leading,-10)
        
        WithViewStore(self.store) { viewStore in
            ZStack{
                ListCardGrid(store: store)
                Text("No gitignore files saved!", bundle: .module)
                    .font(.title2)
                    .opacity(viewStore.state.list.count == 0 ? 1 : 0)
            }
            .onAppear{
                viewStore.send(.onAppear)
            }
        }
    }
}
