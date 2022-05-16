//
//  ListCardView.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/13.
//

import SwiftUI
import FoundationUtil

struct ListCardView : View{
    let card : ListModelex
    
    var body: some View{
        HStack() {
            VStack(alignment: .leading) {
                HStack{
                    Text(card.title)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding(.bottom, 8)
                        .fixedSize(horizontal: false, vertical: true)
                        .layoutPriority(98)
                    Spacer()
                    Button(action: {
                        withAnimation{
                            self.card.bookMark = !self.card.bookMark
                            Image(systemName: card.bookMark ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                        }
                    }, label: {
                        Image(systemName: card.bookMark ? "star.fill" : "star")
                            .foregroundColor(.yellow)
                    }).buttonStyle(PlainButtonStyle())
                }
                Text(Date().usingDate(time: card.time))
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
                    .layoutPriority(99)
                ScrollView(.horizontal){
                    ForEach(0..<card.tag.count, id: \.self) { index in
                        typeListCellView(type: card.tag[index])
                    }
                }.fixedSize(horizontal: false, vertical: true)
            }
            Spacer()
        }
        .padding([.leading, .trailing, .bottom,.top], 10)
        .cornerRadius(8)
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ListCardView(card: ListModelex(title: "ㅇ", tag: ["spm"], bookMark: true))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
