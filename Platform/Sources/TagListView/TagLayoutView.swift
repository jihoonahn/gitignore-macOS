import SwiftUI


public struct TagView: View {
    
    @State var tags: [String]
    @State private var totalHeight = CGFloat.zero       // << variant for ScrollView/List //    = CGFloat.infinity   // << variant for VStack
    public var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)// << variant for ScrollView/List
        //.frame(maxHeight: totalHeight) // << variant for VStack
    }

    public init(tags : [String]){
        self.tags = tags
    }
    
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        return ZStack(alignment: .topLeading) {
            ForEach(tags.indices, id: \.self) { index in
                item(for: tags[index])
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width) {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tags[index] == self.tags.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if tags[index] == self.tags.last! {
                            height = 0 // last item
                        }
                        return result
                    })
                    .onTapGesture {
                        tags.remove(at: index)
                    }
            }
        }.background(viewHeightReader($totalHeight))
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
    private func delete (at index : IndexSet){
        tags.remove(atOffsets: index)
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
