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
        WithViewStore(self.store){  viewStore in
            
        }
    }
}

//struct RootView_Previews: PreviewProvider {
//    static var previews: some View {
//        RootView()
//    }
//}
