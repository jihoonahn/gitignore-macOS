//
//  TabBarFeacture.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/12.
//

import ComposableArchitecture

struct TabBarState: Equatable{
    var main = MainState()
    var list = ListState()
    var issue = IssueState()
}

enum TabBarAction{
    case main(MainAction)
    case list(ListAction)
    case issue(IssueAction)
}

struct TabBarEnvironmnet{}

let tabBarReducer = Reducer<
    TabBarState,
    TabBarAction,
    TabBarEnvironmnet
>.combine(
    
    Reducer{ state, action, _ in
        switch action{
        case .main:
            return .none
        case .list:
            return .none
        case .issue:
            return .none
        }
    }

)
