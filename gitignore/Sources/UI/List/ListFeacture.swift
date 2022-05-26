import ComposableArchitecture
import Local

struct ListState: Equatable{
    var listcount : Int = .init()
}

enum ListAction{
    case onAppear
    
}

struct ListEnvironmnet{
    var locals : () -> ServiceDataType
    var mainQueue: () -> AnySchedulerOf<DispatchQueue>
    public init(
        locals : @escaping() -> ServiceDataType,
        mainQueue : @escaping() -> AnySchedulerOf<DispatchQueue>
    ) {
        self.locals = locals
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
