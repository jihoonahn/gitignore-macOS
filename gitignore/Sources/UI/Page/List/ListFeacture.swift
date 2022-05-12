import ComposableArchitecture

struct ListState: Equatable{
    init() {}
}

enum ListAction{

    
}

struct ListEnvironmnet{
    
    public init(){}
    
}

let listReducer = Reducer<
    ListState,
    ListAction,
    ListEnvironmnet
>.combine(


)
