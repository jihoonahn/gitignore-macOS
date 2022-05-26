import ComposableArchitecture

struct ListState: Equatable{
    var listcount : Int = .init()
}

enum ListAction{
    case onAppear
    
}

struct ListEnvironmnet{
    
    var mainQueue: () -> AnySchedulerOf<DispatchQueue>
    public init(
        mainQueue : @escaping() -> AnySchedulerOf<DispatchQueue>
    ) {
        self.mainQueue = mainQueue
    }
}

let listReducer = Reducer<
    ListState,
    ListAction,
    ListEnvironmnet
>{ state ,action, environment in
    switch action{
    case .onAppear:
        return .none
    }
    
}
