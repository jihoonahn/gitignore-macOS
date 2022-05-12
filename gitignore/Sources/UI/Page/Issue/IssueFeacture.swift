import ComposableArchitecture

struct IssueState: Equatable{
    init() {}
}

enum IssueAction{

    
}

struct IssueEnvironmnet{
    
    public init(){}
    
}

let issueReducer = Reducer<
    IssueState,
    IssueAction,
    IssueEnvironmnet
>.combine(


)
