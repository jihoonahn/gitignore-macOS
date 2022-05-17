//
//  TabBarFeacture.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/12.
//

import ComposableArchitecture

struct AppState : Equatable{
    var mainState = MainState()
    var listState = ListState()
    var issueState = IssueState()
}

enum AppAction{
    case mainAction(MainAction)
    case listAction(ListAction)
    case issueAction(IssueAction)
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
        state:\.mainState,
        action: /AppAction.mainAction,
        environment: {
            MainEnvironmnet(mainQueue: $0.mainQueue)
        }
    ),
    listReducer.pullback(
        state:\.listState,
        action: /AppAction.listAction,
        environment: {
            ListEnvironmnet(mainQueue: $0.mainQueue)
        }
    ),
    issueReducer.pullback(
        state:\.issueState,
        action: /AppAction.issueAction,
        environment: {
            IssueEnvironmnet(mainQueue: $0.mainQueue)
        }
    ),
    Reducer{ state, action ,_ in
        switch action{
        case .mainAction:
            return .none
        case .listAction:
            return .none
        case .issueAction:
            return .none
        }
    }
)
.debug()
