import ComposableArchitecture

struct ListState: Equatable{
    init() {}
}

enum ListAction{

    
}

struct ListEnvironmnet{
    var mainQueue: AnySchedulerOf<DispatchQueue>
    
    public init(
      mainQueue: AnySchedulerOf<DispatchQueue>
    ) {
      self.mainQueue = mainQueue
    }
}

let listReducer = Reducer<
    ListState,
    ListAction,
    ListEnvironmnet
>.combine(


)
