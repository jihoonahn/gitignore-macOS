//
//  typeListCell.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/13.
//

import SwiftUI

struct typeListCellView: View {
    let type : String
    
    var body: some View {
        HStack{
            Text(type)
                .font(.subheadline)
                .foregroundColor(.primary)
            Button(action: {}, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.primary)
            }).buttonStyle(PlainButtonStyle())
        }
        .padding()
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10)
            .stroke(Color.orange, lineWidth: 4))
        .shadow(radius: 10)
    }
}

struct typeListCell_Previews: PreviewProvider {
    static var previews: some View {
        typeListCellView(type: "삭제")
    }
}
