//
//  RootFeacture.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/12.
//

import ComposableArchitecture

enum RootState : Equatable{
    case tabBar(TabBarState)
    
    public init() {self = .tabBar(.init())}
}

enum RootAction{
    case tabBarAction(TabBarAction)
}

struct RootEnvironment{}

let rootReducer = Reducer<
    RootState,
    RootAction,
    RootEnvironment
>.combine(
    tabBarReducer.pullback(
        state: /RootState.tabBar,
        action: /RootAction.tabBarAction,
        environment: {_ in TabBarEnvironmnet()}
    )
)
