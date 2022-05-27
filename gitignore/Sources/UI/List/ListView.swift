//
//  ListView.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/11.
//

import SwiftUI
import ComposableArchitecture
import UIUtil
import WaterfallGrid

struct ListView: View {
    let store : Store<ListState,ListAction>

    var body: some View {
        Color.backgroundColor
        .ignoresSafeArea()
        .padding(.leading,-10)
        

        WithViewStore(self.store) { viewStore in
            ListCardGrid(store: store)
                .onAppear{
                    viewStore.send(.onAppear)
                }
        }
    }
}
