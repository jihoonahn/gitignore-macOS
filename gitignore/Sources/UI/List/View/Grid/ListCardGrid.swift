import SwiftUI
import WaterfallGrid
import ComposableArchitecture
import gitignoreView

struct ListCardGrid: View {
    
    let store : Store<ListState,ListAction>
    
    var body: some View {
        ScrollView(showsIndicators: false){
            WithViewStore(self.store){ viewStore in
                WaterfallGrid((0..<viewStore.listcount), id: \.self) { index  in
                    ListCardView(store: store)
                        .background(BlurView())
                        .cornerRadius(20)
                }
                .gridStyle()
                .padding()
            }
        }
    }
}

