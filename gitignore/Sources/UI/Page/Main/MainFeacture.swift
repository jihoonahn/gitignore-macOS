import ComposableArchitecture

struct MainState: Equatable{
    init() {}
}

enum MainAction{

    
}

struct MainEnvironmnet{
    
    public init(){}
    
}

let mainReducer = Reducer<
    MainState,
    MainAction,
    MainEnvironmnet
>.combine(


)
