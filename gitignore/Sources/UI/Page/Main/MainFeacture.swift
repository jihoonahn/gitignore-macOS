import ComposableArchitecture

struct MainState: Equatable{
    var searchQuery = ""
}

enum MainAction{
    case searchQueryChanged(String)
}

struct MainEnvironmnet{
    var mainQueue: AnySchedulerOf<DispatchQueue>
}

let mainReducer = Reducer<
    MainState,
    MainAction,
    MainEnvironmnet
>{ state, action, environment in
    switch action{
        
    case let .searchQueryChanged(query):
        enum SearchId {}
        state.searchQuery = query
        return .none
    }
    
}
