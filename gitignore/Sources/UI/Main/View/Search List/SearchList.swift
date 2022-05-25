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
    
    private var store : Store<MainState, MainAction>
//    var list : [String]
    
    init(store : Store<MainState, MainAction>){
        self.store = store
    }
    var body: some View {
        WithViewStore(store.self){ viewStore in
            ScrollView{
                VStack{
                    ForEach(0..<viewStore.inquiryListString.count, id: \.self) { index  in
                        if !viewStore.inquiryListString.isEmpty{
                            Text(viewStore.inquiryListString[index])
                                .frame(maxWidth : .infinity, minHeight: 40 ,alignment: .leading)
                                .background(.background)
                                .font(.title3)
                                .onTapGesture {
                                    viewStore.send(.tapTagChoose(index))
                                }
                        }
                    }
                }
                .padding([.all], 8)
            }
            .background(.background)
            .cornerRadius(20)
        }
    }
}

