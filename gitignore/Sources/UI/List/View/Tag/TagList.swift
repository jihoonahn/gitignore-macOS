import SwiftUI
import ComposableArchitecture

public struct TagListView: View {
    
    private var store : Store<ListState, ListAction>
    
    init(store : Store<ListState, ListAction>){
        self.store = store
    }
    
    struct ViewState : Equatable{
        var title : String = .init()
        var totalHeight : CGFloat = .init()
        var tagList : [String] = .init()
        init(state : ListState){
            title = state.title
            totalHeight = state.totalHeight
            tagList = state.tagList
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
            ForEach(viewStore.tagList.indices, id: \.self) { index in
                    item(for: viewStore.tagList[index])
                        .padding([.horizontal, .vertical], 4)
                        .alignmentGuide(.leading, computeValue: { d in
                            if (abs(width - d.width) > g.size.width) {
                                width = 0
                                height -= d.height
                            }
                            let result = width
                            if viewStore.tagList[index] == viewStore.tagList.last! {
                                width = 0 //last item
                            } else {
                                width -= d.width
                            }
                            return result
                        })
                        .alignmentGuide(.top, computeValue: {d in
                            let result = height
                            if viewStore.tagList[index] == viewStore.tagList.last! {
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
