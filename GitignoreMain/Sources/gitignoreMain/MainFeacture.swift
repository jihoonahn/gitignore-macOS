import ComposableArchitecture
import Combine
import SwiftUI
import RealmSwift
import gitignoreAPI
import gitignoreLocal
import gitignoreService

public struct MainState: Equatable{
    var searchQuery = ""
    var titleQuery = ""
    var gitignoreStringQuery = ""
    var totalHeight : CGFloat = .zero
    var liststatus : Bool = true
    var addSheetStatus : Bool = false
    var inquiryListString : [String] = .init()
    var gitignoreListString : [String] = .init()
    var userChooseTag : Set<String> = .init()
    
    public init() {}
}

public enum MainAction{
    case onAppear
    case tagTotalHeightAction
    case titleQueryChanged(String) // Sheet의 title Query
    case gitignoreStringQueryChanged(String)
    case addSheetButtonDidTap // addSheetButton 눌렸을 때
    case addSheetCreateFileButtonDidTap // Create File 눌렸을 때
    case addSheetonAppear //add Sheet Button 이 나타났을때
    case saveGitignoreButtonDidTap // Local에 저장할 때
    case searchQueryChanged(String) // textfield action
    case tapTagChoose(Int) //search bar 에서 tag 추가
    case createGitignore // gitignore 데이터 Load
    case tagDelete(Int) // tag Click Delete
    
    case dataLoaded(Result<String, gitignoreError>)
    case gitignoreDataLoaded(Result<String, gitignoreError>)
    case addSheetgitignoreDataLoaded(Result<String,gitignoreError>)
}

public struct MainEnvironmnet{
    var searchGitignoreMenuUseCase : () -> SearchGitignoreMenuUseCase
    var createGitignoreFileUseCase : () -> CreateGitignoreFileUseCase
    var gitignoreLocalSaveUseCase : () -> GitignoreListSaveUseCase
    var mainQueue: () -> AnySchedulerOf<DispatchQueue>
    
    public init(
        searchGitignoreMenuUseCase : @escaping() -> SearchGitignoreMenuUseCase,
        createGitignoreFileUseCase : @escaping() -> CreateGitignoreFileUseCase,
        gitignoreLocalSaveUseCase : @escaping() -> GitignoreListSaveUseCase,
        effects: @escaping() -> ServiceEffectType,
        mainQueue : @escaping() -> AnySchedulerOf<DispatchQueue>
    ){
        self.searchGitignoreMenuUseCase = searchGitignoreMenuUseCase
        self.createGitignoreFileUseCase = createGitignoreFileUseCase
        self.gitignoreLocalSaveUseCase = gitignoreLocalSaveUseCase
        self.mainQueue = mainQueue
    }
}

public let mainReducer = Reducer<
    MainState,
    MainAction,
    MainEnvironmnet
>{ state, action , enviroment in
    var bag: Set<AnyCancellable> = .init()
    
    switch action{
    case .tagTotalHeightAction:
        return.none
        
    case .titleQueryChanged(let query):
        state.titleQuery = query
        return .none
        
    case .gitignoreStringQueryChanged(let query):
        state.gitignoreStringQuery = query
        return .none
        
    case .searchQueryChanged(let query):
        enum SearchOptionId {}
        state.searchQuery = query
        state.inquiryListString  = state.gitignoreListString.filter{ $0.hasPrefix(query.lowercased()) || state.searchQuery.isEmpty}
        state.liststatus = state.searchQuery.isEmpty || state.inquiryListString.isEmpty
        if state.searchQuery.isEmpty{state.inquiryListString = .init()}
        guard !query.isEmpty else {return .cancel(id: SearchOptionId.self)}
        return .none
        
    case .onAppear:
        return enviroment.searchGitignoreMenuUseCase().execute()
            .receive(on: enviroment.mainQueue())
            .map{ $0 }
            .catchToEffect(MainAction.dataLoaded)
        
    case .addSheetonAppear:
        if state.userChooseTag.isEmpty{state.gitignoreStringQuery = .init()}
        return enviroment.createGitignoreFileUseCase().execute(tag: Array(state.userChooseTag))
            .receive(on: enviroment.mainQueue())
            .catchToEffect(MainAction.addSheetgitignoreDataLoaded)
        
    case .createGitignore:
        guard !state.userChooseTag.isEmpty else {return .none}
        return enviroment.createGitignoreFileUseCase().execute(tag: Array(state.userChooseTag))
            .receive(on: enviroment.mainQueue())
            .catchToEffect(MainAction.gitignoreDataLoaded)
        
    case .tapTagChoose(let index):
        guard !state.inquiryListString.isEmpty else {return .none}
        state.userChooseTag.insert(state.inquiryListString[index])
        state.searchQuery = ""
        return .none
        
    case .tagDelete(let index) :
        state.userChooseTag.remove(Array(state.userChooseTag)[index])
        return .none
        
    case .addSheetButtonDidTap:
        state.addSheetStatus = !state.addSheetStatus
        return .none
        
    case .saveGitignoreButtonDidTap:
        guard !state.userChooseTag.isEmpty && !state.titleQuery.isEmpty else {return .none}
        enviroment.gitignoreLocalSaveUseCase().execute(gitignore: GitignoreList(
            id: ObjectId.generate(),
            title: state.titleQuery,
            arrayTags: Array(state.userChooseTag),
            date: Date(),
            gitignoreString: state.gitignoreStringQuery)
        )
        state.addSheetStatus = !state.addSheetStatus
        return .none
        
    case .addSheetCreateFileButtonDidTap:
        guard !state.gitignoreStringQuery.isEmpty else {return .none}
        guard let url = NSSavePanel().showSavePanel() else {return .none}
        try? state.gitignoreStringQuery.write(to: url, atomically: true, encoding: .utf8)
        return  .none
        
        //MARK: - Data Load
    case .dataLoaded(let result):
        switch result{
        case .success(let result):
            state.gitignoreListString =  result.replacingOccurrences(of: "\n", with: ",").split(separator: ",").map{ (value) -> String in return (String(value))}
            return .none
        case .failure(let result):
            return .none
        }
        
    case .gitignoreDataLoaded(let result):
        switch result{
        case .success(let result):
            guard let url = NSSavePanel().showSavePanel() else {return .none}
            try? result.write(to: url, atomically: true, encoding: .utf8)
            return .none
        case .failure(let result):
            return.none
        }
    case .addSheetgitignoreDataLoaded(let result):
        switch result{
        case .success(let result):
            guard !state.userChooseTag.isEmpty else {return .none}
            state.gitignoreStringQuery = result
            return .none
        case .failure(let result):
            return .none
        }
    }
}
