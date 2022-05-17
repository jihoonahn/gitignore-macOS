import ComposableArchitecture

struct IssueState: Equatable{
    var issuePageURL = URL(string: "https://github.com/JiHoonAHN/.gitignore-macOS/issues")
}

enum IssueAction{

}

struct IssueEnvironmnet{
    var mainQueue: AnySchedulerOf<DispatchQueue>
    
    public init(
      mainQueue: AnySchedulerOf<DispatchQueue>
    ) {
      self.mainQueue = mainQueue
    }
}

let issueReducer = Reducer<
    IssueState,
    IssueAction,
    IssueEnvironmnet
>.combine(
    
    
)
