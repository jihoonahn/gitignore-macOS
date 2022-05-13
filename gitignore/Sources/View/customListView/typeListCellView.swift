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
        }.padding()
    }
}

struct typeListCell_Previews: PreviewProvider {
    static var previews: some View {
        typeListCellView(type: "삭제")
    }
}
