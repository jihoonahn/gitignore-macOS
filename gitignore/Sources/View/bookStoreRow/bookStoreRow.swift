//
//  bookStoreRow.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/13.
//

import SwiftUI

struct bookStoreRow: View {
    var body: some View {
        HStack{
            VStack{
                Text("Title").font(.system(size: 12, weight: .bold))
                Text("date").font(.system(size: 9, weight: .regular)).foregroundColor(.gray)
            }
            Spacer(minLength: 10)
            Button(action: {}, label: {
                Image(systemName: "star.fill").foregroundColor(.yellow)
            }).buttonStyle(PlainButtonStyle())
        }
    }
}

struct bookStoreRow_Previews: PreviewProvider {
    static var previews: some View {
        bookStoreRow()
    }
}
