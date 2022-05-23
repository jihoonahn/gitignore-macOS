//
//  ListCardView.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/13.
//

import SwiftUI
import FoundationUtil
import TagListView

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
                            withAnimation{ print(card.bookMark)}
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
                    TagView(tags: card.tag, isEnabled: false)
                    .fixedSize(horizontal: false, vertical: true)
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
