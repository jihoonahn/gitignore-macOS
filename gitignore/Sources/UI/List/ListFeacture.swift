import ComposableArchitecture
import Combine
import OSLogUtil

struct ListState: Equatable{
    var totalHeight : CGFloat = .zero
    var listcount : Int = 10
    var title : String = "swift"
    var time : Date = .now
    var tagList : [String] = ["swift","swiftpackagemanager", "cocoapods"]
}

enum ListAction{
    case onAppear
    case tagTotalHeightAction
    case viewHeightReader(CGFloat)
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
    case .tagTotalHeightAction:
        return .none
    case .viewHeightReader(let rect):
        state.totalHeight = rect
        return .none
    }
}

