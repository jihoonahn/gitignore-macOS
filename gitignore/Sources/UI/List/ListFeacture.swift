import ComposableArchitecture
import Local

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
    var locals : () -> ServiceDataType
    var mainQueue: () -> AnySchedulerOf<DispatchQueue>
    public init(
        locals : @escaping() -> ServiceDataType,
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
        environment.locals().coreData.fetchPersons()
            .sink(receiveCompletion: { error in
                
            }, receiveValue: {
                
            })
        return .none
    case .tagTotalHeightAction:
        return .none
    case .viewHeightReader(let rect):
        state.totalHeight = rect
        return .none
    }
}

