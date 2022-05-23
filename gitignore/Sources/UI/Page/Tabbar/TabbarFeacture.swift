//
//  TabBarFeacture.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/12.
//

import ComposableArchitecture
import Effects

struct TabBarState : Equatable{
    var mainState = MainState()
    var listState = ListState()
    var issueState = IssueState()
}

enum TabBarAction{
    case mainAction(MainAction)
    case listAction(ListAction)
    case issueAction(IssueAction)
}

struct tabBarEnvironmnet{}

let appReducer = Reducer<TabBarState,TabBarAction,tabBarEnvironmnet>.combine(
    
    mainReducer.pullback(
        state:\.mainState,
        action: /TabBarAction.mainAction,
        environment: {_ in
                .init(
                    request: {EffectsImpl().searchGitignoreMenuAPI()},
                    mainQueue: { .main}
                )
        }
    ),
    listReducer.pullback(
        state:\.listState,
        action: /TabBarAction.listAction,
        environment: {_ in
                .init()
        }
    ),
    issueReducer.pullback(
        state:\.issueState,
        action: /TabBarAction.issueAction,
        environment: { _ in
                .init()
        }
    ),
    Reducer{ state, action ,_ in
        switch action{
        default:
            return .none
        }
    }
)
