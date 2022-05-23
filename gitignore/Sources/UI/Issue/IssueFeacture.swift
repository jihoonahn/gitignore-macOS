import ComposableArchitecture

struct IssueState: Equatable{
    var issuePageURL = URL(string: "https://github.com/JiHoonAHN/.gitignore-macOS/issues")
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
