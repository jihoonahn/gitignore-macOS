import ComposableArchitecture
import Combine
import OSLogUtil
import SwiftUI
import RealmSwift
import gitignoreLocal
import gitignoreService
import Foundation

struct ListState: Equatable{
    var totalHeight : CGFloat = .zero
    var list : [GitignoreList] = .init()
}

enum ListAction{
    case onAppear
    case tagTotalHeightAction
    case deleteListCell(ObjectId)
    case viewHeightReader(CGFloat)
    case createGitignoreFile(String)
    
    case fetchList(Result<[GitignoreList],Never>)
}

struct ListEnvironmnet{
    var gitignoreListFetchUseCase : () -> GitignoreListFetchUseCase
    var gitignoreListDeleteUseCase : () -> GitignoreListDeleteUseCase
    var mainQueue: () -> AnySchedulerOf<DispatchQueue>
    
    public init(
        gitignoreListFetchUseCase : @escaping() -> GitignoreListFetchUseCase,
        gitignoreListDeleteUseCase : @escaping() -> GitignoreListDeleteUseCase,
        mainQueue : @escaping() -> AnySchedulerOf<DispatchQueue>
    ) {
        self.gitignoreListFetchUseCase = gitignoreListFetchUseCase
        self.gitignoreListDeleteUseCase = gitignoreListDeleteUseCase
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
        
    case .deleteListCell(let id):
        environment.gitignoreListDeleteUseCase().execute(id: id)
        return environment.gitignoreListFetchUseCase().execute()
            .receive(on: environment.mainQueue())
            .eraseToEffect()
            .catchToEffect(ListAction.fetchList)
        
    case let .createGitignoreFile(gitignoreString):
        guard let url = NSSavePanel().showSavePanel() else {return .none}
        try? gitignoreString.write(to: url, atomically: true, encoding: .utf8)
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

