//
//  SearchList.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/23.
//

import SwiftUI
import ComposableArchitecture
import gitignoreView
import UIUtil

struct SearchList: View {
    
    private var store : Store<MainState, MainAction>
    
    init(store : Store<MainState, MainAction>){
        self.store = store
    }
    
    struct ViewState : Equatable{
        var inquiryListString : [String]
        
        init(state : MainState){
            inquiryListString = state.inquiryListString
        }
    }
    
    var body: some View {
        WithViewStore(self.store.scope(state: ViewState.init)){ viewStore in
            ScrollView{
                VStack{
                    ForEach(0..<viewStore.inquiryListString.count, id: \.self) { index  in
                        if !viewStore.inquiryListString.isEmpty{
                            Text(viewStore.inquiryListString[index])
                                .frame(maxWidth : .infinity, minHeight: 40 ,alignment: .leading)
                                .background(Color.searchBarColor)
                                .font(.title3)
                                .onTapGesture {
                                    viewStore.send(.tapTagChoose(index))
                                }
                        }
                    }
                }
                .padding([.all], 8)
            }
            .background(Color.searchBarColor)
            .cornerRadius(20)
        }
    }
}

