import ComposableArchitecture
import Combine
import OSLogUtil
import Local

struct ListState: Equatable{
    var totalHeight : CGFloat = .zero
    var listcount : Int = 10
    var title : String = "swift"
    var list : [GitignoreList] = .init()
    var time : Date = .now
    var tagList : [String] = ["swift","swiftpackagemanager", "cocoapods"]
}

enum ListAction{
    case onAppear
    case tagTotalHeightAction
    case viewHeightReader(CGFloat)
}

struct ListEnvironmnet{
    var locals : () -> ServiceCoreDataType
    var mainQueue: () -> AnySchedulerOf<DispatchQueue>
    public init(
        locals : @escaping() -> ServiceCoreDataType,
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
        environment.locals().coreData.fetch()
        return .none
    case .tagTotalHeightAction:
        return .none
    case .viewHeightReader(let rect):
        state.totalHeight = rect
        return .none
    }
}

