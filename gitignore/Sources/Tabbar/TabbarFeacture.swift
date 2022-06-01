import ComposableArchitecture
import Effects
import Local

struct TabBarState : Equatable{
    var selectedTab : String = "Home"
    
    var mainState = MainState()
    var listState = ListState()
}

enum TabBarAction{
    case selectTabBarButton(String)
    case mainAction(MainAction)
    case listAction(ListAction)
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
                    mainQueue: {.main}
                )
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
