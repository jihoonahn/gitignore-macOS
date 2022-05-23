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
    
    
)
