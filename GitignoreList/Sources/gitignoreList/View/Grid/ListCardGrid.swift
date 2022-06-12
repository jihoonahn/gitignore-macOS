import SwiftUI
import WaterfallGrid
import ComposableArchitecture
import gitignoreView

struct ListCardGrid: View {
    
    let store : Store<ListState,ListAction>
    
    var body: some View {
        ScrollView(showsIndicators: false){
            WithViewStore(self.store){ viewStore in
                WaterfallGrid((0..<viewStore.list.count), id: \.self) { index  in
                    ListCardView(store: store, list: viewStore.list[index])
                        .background(BlurView())
                        .onTapGesture {
                            viewStore.send(.createGitignoreFile(viewStore.list[index].gitignoreString))
                        }
                        .cornerRadius(20)
                }
                .gridStyle()
                .padding()
            }
        }
    }
}

