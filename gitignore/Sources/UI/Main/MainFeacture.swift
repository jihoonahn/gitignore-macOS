import ComposableArchitecture
import Effects

struct MainState: Equatable{
    var searchQuery = ""
    var gitignoreListString : String = .init()
}

enum MainAction{
    case searchQueryChanged(String)
    case onAppear
    case dataLoaded(Result<String, ApiError>)
}

struct MainEnvironmnet{
    var request: () -> Effect<String, ApiError>
    var mainQueue: () -> AnySchedulerOf<DispatchQueue>
    
    public init(
        request: @escaping() -> Effect<String, ApiError>,
        mainQueue : @escaping() -> AnySchedulerOf<DispatchQueue>
    ){
        self.request = request
        self.mainQueue = mainQueue
    }
}
let mainReducer = Reducer<
    MainState,
    MainAction,
    MainEnvironmnet
>{ state, action , enviroment in
    switch action{
    case .searchQueryChanged(_):
        return .none
    case .onAppear:
        return enviroment.request()
            .receive(on: enviroment.mainQueue())
            .catchToEffect(MainAction.dataLoaded)
    case .dataLoaded(.success(let result)):
        state.gitignoreListString = result
        print(result)
        return .none
    case .dataLoaded(.failure(let result)):
        return .none
    }
}
