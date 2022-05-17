import ComposableArchitecture

struct MainState: Equatable{
    var searchQuery = ""
}

enum MainAction{
    case searchQueryChanged(String)
}

struct MainEnvironmnet{
    var mainQueue: AnySchedulerOf<DispatchQueue>
    
    public init(
      mainQueue: AnySchedulerOf<DispatchQueue>
    ) {
      self.mainQueue = mainQueue
    }
}

let mainReducer = Reducer<MainState,MainAction,MainEnvironmnet>{ state, action, environment in
    switch action{
        
    case let .searchQueryChanged(query):
        state.searchQuery = query
        return .none
    }
    
}
