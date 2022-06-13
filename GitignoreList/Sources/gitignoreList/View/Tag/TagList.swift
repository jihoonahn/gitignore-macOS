import SwiftUI
import ComposableArchitecture
import gitignoreLocal

public struct TagListView: View {
    
    private var store : Store<ListState, ListAction>
    private var list : GitignoreList
    
    init(store : Store<ListState, ListAction>, list : GitignoreList){
        self.store = store
        self.list = list
    }
    
    struct ViewState : Equatable{
        var totalHeight : CGFloat = .init()
        init(state : ListState){
            totalHeight = state.totalHeight
        }
    }
    
    public var body: some View {
        WithViewStore(store.self){ viewStore in
            VStack {
                GeometryReader { geometry in
                    self.generateContent(in: geometry)
                }
            }
            .frame(height: viewStore.totalHeight)
        }
    }
    
    
    
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        return WithViewStore(store.scope(state: ViewState.init)){viewStore in
        ZStack(alignment: .topLeading) {
            ForEach(list.arrayTags.indices, id: \.self) { index in
                item(for: list.arrayTags[index])
                        .padding([.horizontal, .vertical], 4)
                        .alignmentGuide(.leading, computeValue: { d in
                            if (abs(width - d.width) > g.size.width) {
                                width = 0
                                height -= d.height
                            }
                            let result = width
                            if list.arrayTags[index] == list.arrayTags.last! {
                                width = 0 //last item
                            } else {
                                width -= d.width
                            }
                            return result
                        })
                        .alignmentGuide(.top, computeValue: {d in
                            let result = height
                            if list.arrayTags[index] == list.arrayTags.last! {
                                height = 0 // last item
                            }
                            return result
                        })
                }
        }.background(viewHeightReader())
        }
    }
    
    private func item(for text: String) -> some View {
        HStack{
            Text(text)
                .foregroundColor( Color.white )
                .padding()
                .lineLimit(1)
                .background(Color.orange)
                .frame(height: 36)
                .cornerRadius(18)
                .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
        }
    }
    private func viewHeightReader() -> some View {
        return WithViewStore(store.self){ viewStore in
            GeometryReader { geometry -> Color in
                let rect = geometry.frame(in: .local)
                DispatchQueue.main.async {
                    viewStore.send(.viewHeightReader(rect.size.height))
                }
                return .clear
            }
        }
    }
}
