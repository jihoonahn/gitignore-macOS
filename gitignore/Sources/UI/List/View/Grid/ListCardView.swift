import SwiftUI
import FoundationUtil
import ComposableArchitecture
import gitignoreLocal

struct ListCardView : View{
    let store : Store<ListState,ListAction>
    let list : GitignoreList
    
    init(store : Store<ListState,ListAction>, list : GitignoreList) {
        self.store = store
        self.list = list
    }
    
    var body: some View{
        WithViewStore(self.store){ viewStore in
            HStack() {
                VStack(alignment: .leading) {
                    HStack{
                        Text(list.title )
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding(.bottom, 8)
                            .fixedSize(horizontal: false, vertical: true)
                            .layoutPriority(98)
                        Spacer()
                        Button(action: {
                            withAnimation{ viewStore.send(.deleteListCell(list.id))}
                        }, label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.backgourndColor_Opposition)
                        }).buttonStyle(PlainButtonStyle())
                    }
                    Text(Date().usingDate(time: list.date))
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                        .layoutPriority(99)
                    TagListView(store: store, list: list)
                        .fixedSize(horizontal: false, vertical: true)
                }
                Spacer()
            }
            .padding([.leading, .trailing, .bottom,.top], 10)
            .cornerRadius(8)
        }
    }
}

