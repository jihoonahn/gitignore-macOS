import SwiftUI
import ComposableArchitecture

public struct TagMainView: View {
    
    private var store : Store<MainState, MainAction>

    init(store : Store<MainState, MainAction>){
        self.store = store
    }
    
    struct ViewState : Equatable{
        var userChooseTag : Set<String>
        var totalHeight : CGFloat
        init(state : MainState){
            userChooseTag = state.userChooseTag
            totalHeight = state.totalHeight
        }
    }
    
    public var body: some View {
        WithViewStore(store.scope(state: ViewState.init)){ viewStore in
            VStack {
                GeometryReader { geometry in
                    ScrollView(.vertical){
                        self.generateContent(in: geometry)
                    }.frame(height: 90)
                }
            }
            .frame(height: viewStore.totalHeight)
        }
    }
    
    //MARK: - Method
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        return ZStack(alignment: .topLeading) {
            WithViewStore(self.store.scope(state: ViewState.init)) { viewStore in
                
                let tag : Array<String> = Array(viewStore.userChooseTag)
                
                ForEach(tag.indices, id: \.self) { index in
                    item(for: tag[index])
                        .padding([.horizontal, .vertical], 4)
                        .alignmentGuide(.leading, computeValue: { d in
                            if (abs(width - d.width) > g.size.width) {
                                width = 0
                                height -= d.height
                            }
                            let result = width
                            if tag[index] == tag.last! {
                                width = 0 //last item
                            } else {
                                width -= d.width
                            }
                            return result
                        })
                        .alignmentGuide(.top, computeValue: {d in
                            let result = height
                            if tag[index] == tag.last! {
                                height = 0 // last item
                            }
                            return result
                        })
                        .onTapGesture {
                            viewStore.send(MainAction.tagDelete(index))
                        }
                }.background(viewHeightReader(viewStore.binding(
                    get: \.totalHeight, send: MainAction.tagTotalHeightAction
                )))
            }
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
    
    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}
