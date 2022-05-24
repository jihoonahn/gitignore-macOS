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
                            .frame(maxWidth : .infinity, minHeight: 40 ,alignment: .leading)
                            .font(.title3)
                            .onTapGesture {
                                print( list[index])
                            }
                    }
                }
            }
            .padding([.top,.leading,.bottom], 5)
        }
        .background(.background)
        .cornerRadius(20)
        .frame(width: 300, height: 200)
    }
}

struct SearchList_Previews: PreviewProvider {
    static var previews: some View {
        SearchList(list: ["adobe","ai"])
    }
}
