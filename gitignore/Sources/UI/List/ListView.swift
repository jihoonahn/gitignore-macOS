import SwiftUI
import ComposableArchitecture
import UIUtil
import WaterfallGrid

struct ListView: View {
    let store : Store<ListState,ListAction>

    var body: some View {
        Color.backgroundColor
        .ignoresSafeArea()
        .padding(.leading,-10)
        
        WithViewStore(self.store) { viewStore in
            ZStack{
                ListCardGrid(store: store)
                Image("")
                    .resizable().hi
            }
            .onAppear{
                viewStore.send(.onAppear)
            }
        }
    }
}
