import ComposableArchitecture
import Combine
import OSLogUtil
import gitignoreLocal
import gitignoreService

struct ListState: Equatable{
    var totalHeight : CGFloat = .zero
    var list : [GitignoreList] = .init()
}

enum ListAction{
    case onAppear
    case tagTotalHeightAction
    case viewHeightReader(CGFloat)
    case fetchList(Result<[GitignoreList],Never>)
}

struct ListEnvironmnet{
    var gitignoreListFetchUseCase : () -> GitignoreListFetchUseCase
    var mainQueue: () -> AnySchedulerOf<DispatchQueue>
    
    public init(
        gitignoreListFetchUseCase : @escaping() -> GitignoreListFetchUseCase,
        mainQueue : @escaping() -> AnySchedulerOf<DispatchQueue>
    ) {
        self.gitignoreListFetchUseCase = gitignoreListFetchUseCase
        self.mainQueue = mainQueue
    }
}
var bag = Set<AnyCancellable>()

let listReducer = Reducer<
    ListState,
    ListAction,
    ListEnvironmnet
>{ state ,action, environment in
    switch action{
    case .onAppear:
        return environment.gitignoreListFetchUseCase().execute()
            .receive(on: environment.mainQueue())
            .eraseToEffect()
            .catchToEffect(ListAction.fetchList)
        
    case .tagTotalHeightAction:
        return .none
        
    case .viewHeightReader(let rect):
        state.totalHeight = rect
        return .none
        
        //MARK: - Local
    case .fetchList(let result):
        switch result{
        case .success(let result):
            state.list = result
            return.none
        }
    }
}

