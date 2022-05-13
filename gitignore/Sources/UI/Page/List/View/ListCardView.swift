//
//  ListCardView.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/13.
//

import SwiftUI

struct ListCardView : View{
    let card : Card
    
    var body: some View{
        HStack() {
            VStack(alignment: .leading) {
                Text(card.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding(.bottom, 8)
                    .fixedSize(horizontal: false, vertical: true)
                    .layoutPriority(98)
                Text(card.subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
                    .layoutPriority(99)
                ScrollView(){
    
                    
                }
            }
            Spacer()
        }
        .padding([.leading, .trailing, .bottom], 8)
        .cornerRadius(8)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .shadow(color: .gray, radius: .infinity, x: 10, y: 10)
        )
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ListCardView(card: Card(title: "best Setting", subtitle: "2022년 3월 21일", tag: ["swift","page"]))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
