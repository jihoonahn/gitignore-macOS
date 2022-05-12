//
//  TabBarFeacture.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/12.
//

import ComposableArchitecture

struct TabBarState: Equatable{
    
    var main = MainState()
}

enum TabBarAction{
    case mainAction(MainAction)
    
}

struct TabBarEnvironmnet{}

let tabBarReducer = Reducer<
    TabBarState,
    TabBarAction,
    TabBarEnvironmnet
>.combine(
    
    Reducer{ state, action, _ in
        switch action{
            
        }
    }

)
