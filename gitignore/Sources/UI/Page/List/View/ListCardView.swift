//
//  ListCardView.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/13.
//

import SwiftUI
import FoundationUtil

struct ListCardView : View{
    let card : ListModel
    
    var body: some View{
        HStack() {
            VStack(alignment: .leading) {
                Text(card.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding(.bottom, 8)
                    .fixedSize(horizontal: false, vertical: true)
                    .layoutPriority(98)
                Text(Date().usingDate(time: card.time))
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
                    .layoutPriority(99)
                ScrollView(.vertical){
                    
                    
                }.fixedSize(horizontal: false, vertical: true)
            }
            Spacer()
        }
        .frame(width: 300)
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
        ListCardView(card: ListModel.init())
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
