import ComposableArchitecture

enum RootState: Equatable{
    case tabBar(TabBarState)
    public init() { self = .tabBar(.init())}
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
        environment: { _ in tabBarEnvironmnet()}
    ),
    Reducer{ _ , action, _ in
        switch action {
        case .tabBarAction:
            return .none
        }
    }
)
