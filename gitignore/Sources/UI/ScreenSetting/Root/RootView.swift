//
//  RootView.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/11.
//

import SwiftUI
import ComposableArchitecture

struct RootView: View {
    let store : Store<RootState,RootAction>
    
    init(store : Store<RootState,RootAction>){
        self.store = store
    }
    
    var body: some View {
        WithViewStore(self.store){ _ in
            TabBarView(store: self.store.scope(
                state: \.tabBar,
                action: RootAction.tabBarAction
            ))
        }
    }
}
