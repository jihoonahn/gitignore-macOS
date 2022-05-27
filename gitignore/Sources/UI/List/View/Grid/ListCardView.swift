//
//  ListCardView.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/13.
//

import SwiftUI
import FoundationUtil
import ComposableArchitecture

struct ListCardView : View{
    let store : Store<ListState,ListAction>
    
    var body: some View{
        WithViewStore(self.store){ viewStore in
            HStack() {
                VStack(alignment: .leading) {
                    HStack{
                        Text(viewStore.title)
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding(.bottom, 8)
                            .fixedSize(horizontal: false, vertical: true)
                            .layoutPriority(98)
                        Spacer()
                        Button(action: {
                            withAnimation{ print("Delete")}
                        }, label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.backgourndColor_Opposition)
                        }).buttonStyle(PlainButtonStyle())
                    }
                    Text(Date().usingDate(time: viewStore.time))
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                        .layoutPriority(99)
                    TagListView(store: store)
                        .fixedSize(horizontal: false, vertical: true)
                }
                Spacer()
            }
            .padding([.leading, .trailing, .bottom,.top], 10)
            .cornerRadius(8)
        }
    }
}

