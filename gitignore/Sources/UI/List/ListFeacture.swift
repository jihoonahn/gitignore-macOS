import ComposableArchitecture
import LocalService

struct ListState: Equatable{
    var listcount : Int = .init()
}

enum ListAction{
    case onAppear
    
}

struct ListEnvironmnet{
    
    var mainQueue: () -> AnySchedulerOf<DispatchQueue>
    var localService : () -> ServiceRealmType
    public init(
        mainQueue : @escaping() -> AnySchedulerOf<DispatchQueue>,
        localService :  @escaping() -> ServiceRealmType
    ) {
        self.mainQueue = mainQueue
        self.localService = localService
    }
}

let listReducer = Reducer<
    ListState,
    ListAction,
    ListEnvironmnet
>{ state ,action, environment in
    switch action{
    case .onAppear:
        environment.localService()
        return .none
    }
    
}
