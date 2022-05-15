//
//  RootFeacture.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/12.
//

import ComposableArchitecture

struct RootState : Equatable{
    var tabBar = TabBarState()
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
        state: \.tabBar,
        action: /RootAction.tabBarAction,
        environment: {_ in TabBarEnvironmnet()}
    )
)
