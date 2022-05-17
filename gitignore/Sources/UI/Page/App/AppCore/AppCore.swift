//
//  TabBarFeacture.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/12.
//

import ComposableArchitecture

enum AppState : Equatable{
    case main(MainState)
    case list(ListState)
    case issue(IssueState)
    
    public init() {self = .main(.init())}
}

enum AppAction{
    case main(MainAction)
    case list(ListAction)
    case issue(IssueAction)
}

struct AppEnvironmnet{
    public var mainQueue: AnySchedulerOf<DispatchQueue>
    
    public init(
        mainQueue: AnySchedulerOf<DispatchQueue>
    ){
        self.mainQueue = mainQueue
    }
}

let appReducer = Reducer<AppState,AppAction,AppEnvironmnet>.combine(
    
    mainReducer.pullback(
        state: /AppState.main,
        action: /AppAction.main,
        environment: {
            MainEnvironmnet(mainQueue: $0.mainQueue)
        }
    ),
    listReducer.pullback(
        state: /AppState.list,
        action: /AppAction.list,
        environment: {
            ListEnvironmnet(mainQueue: $0.mainQueue)
        }
    ),
    issueReducer.pullback(
        state: /AppState.issue,
        action: /AppAction.issue,
        environment: {
            IssueEnvironmnet(mainQueue: $0.mainQueue)
        }
    ),
    Reducer{ state, action ,_ in
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
