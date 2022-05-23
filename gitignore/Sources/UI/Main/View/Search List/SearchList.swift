//
//  SearchList.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/23.
//

import SwiftUI
import ComposableArchitecture
import gitignoreView

struct SearchList: View {
    
    var list : [String]
    
    var body: some View {
        ScrollView{
            VStack{
                ForEach(0..<list.count, id: \.self) { index  in
                    if !list.isEmpty{
                        Text(list[index])
                            .padding(5)
                            .background(.red)
                            .frame(maxWidth : .infinity,alignment: .leading)
                            .onTapGesture {
                                print( list[index])
                            }
                    }
                    Divider()
                }
            }.padding(5)
        }
        .padding(5)
        .background(.background)
        .cornerRadius(20)
    }
}

struct SearchList_Previews: PreviewProvider {
    static var previews: some View {
        SearchList(list: ["adobe","ai"])
    }
}
