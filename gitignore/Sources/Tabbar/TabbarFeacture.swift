//
//  TabBarFeacture.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/12.
//

import ComposableArchitecture
import Effects
import LocalService

struct TabBarState : Equatable{
    var selectedTab : String = "Home"
    
    var mainState = MainState()
    var listState = ListState()
    var issueState = IssueState()
}

enum TabBarAction{
    case selectTabBarButton(String)
    case mainAction(MainAction)
    case listAction(ListAction)
    case issueAction(IssueAction)
}

struct tabBarEnvironmnet{}

let tabBarReducer = Reducer<TabBarState, TabBarAction, tabBarEnvironmnet>.combine(
    
    mainReducer.pullback(
        state:\.mainState,
        action: /TabBarAction.mainAction,
        environment: {_ in
                .init(
                    effects: { ServiceEffect()},
                    mainQueue: {.main}
                )
        }
    ),
    listReducer.pullback(
        state:\.listState,
        action: /TabBarAction.listAction,
        environment: {_ in
                .init(
                    mainQueue: {.main},
                    localService: { ServiceRealm()}
                )
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
        case .selectTabBarButton(let title):
            state.selectedTab = title
            return .none
        default :
            return .none
        }
    }
)
