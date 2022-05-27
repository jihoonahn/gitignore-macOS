import ComposableArchitecture
import Combine
import CombineCoreData
import Local
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
    var locals : ServiceDataType
    var mainQueue: () -> AnySchedulerOf<DispatchQueue>
    public init(
        locals : ServiceDataType,
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
    var bag: Set<AnyCancellable> = .init()

    switch action{
    case .onAppear:
        environment.locals.coreData.fetchPersons()
            .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: { result in
                print(result)
            }).store(in: &bag)
        return .none
    case .tagTotalHeightAction:
        return .none
    case .viewHeightReader(let rect):
        state.totalHeight = rect
        return .none
    }
}

