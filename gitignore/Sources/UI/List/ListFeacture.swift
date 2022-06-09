import ComposableArchitecture
import Combine
import OSLogUtil
import gitignoreLocal

struct ListState: Equatable{
    var totalHeight : CGFloat = .zero
    var list : [GitignoreList] = .init()
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
//        state.list = environment.locals().coreData.fetch()
        return .none
    case .tagTotalHeightAction:
        return .none
    case .viewHeightReader(let rect):
        state.totalHeight = rect
        return .none
    }
}

