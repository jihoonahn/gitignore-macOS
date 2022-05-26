import ComposableArchitecture
import Combine
import Effects
import SwiftUI
import Local

struct MainState: Equatable{
    var searchQuery = ""
    var titleQuery = ""
    var totalHeight : CGFloat = .zero
    var liststatus : Bool = true
    var addSheetStatus : Bool = false
    var inquiryListString : [String] = .init()
    var gitignoreListString : [String] = .init()
    var userChooseTag : Set<String> = .init()
}

enum MainAction{
    case onAppear
    case tagTotalHeightAction
    case titleQueryChanged(String) // Sheet의 title Query
    case addSheetButtonDidTap // addSheetButton 눌렀을때
    case saveGitignoreButtonDidTap
    case searchQueryChanged(String) // textfield action
    case tapTagChoose(Int) //search bar 에서 tag 추가
    case createGitignore // gitignore 데이터 Load
    case tagDelete(Int) // tag Click Delete
    
    case dataLoaded(Result<String, ApiError>)
    case gitignoreDataLoaded(Result<String, ApiError>)
    case savegitignoreDataLoaded(Result<String, ApiError>)
}

struct MainEnvironmnet{
    var effects : () -> ServiceEffectType
    var locals : () -> ServiceDataType
    var mainQueue: () -> AnySchedulerOf<DispatchQueue>
    public init(
        effects: @escaping() -> ServiceEffectType,
        locals : @escaping() -> ServiceDataType,
        mainQueue : @escaping() -> AnySchedulerOf<DispatchQueue>
    ){
        self.effects = effects
        self.locals = locals
        self.mainQueue = mainQueue
    }
}
var bag: [AnyCancellable] = []

let mainReducer = Reducer<
    MainState,
    MainAction,
    MainEnvironmnet
>{ state, action , enviroment in
    
    switch action{
    case .tagTotalHeightAction:
        return.none
        
    case .titleQueryChanged(let query):
        state.titleQuery = query
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
        return enviroment.effects().effect.searchGitignoreMenuAPI()
            .receive(on: enviroment.mainQueue())
            .catchToEffect(MainAction.dataLoaded)
        
    case .createGitignore:
        guard !state.userChooseTag.isEmpty else {return .none}
        return enviroment.effects().effect.makeGitignoreFileAPI(tag: Array(state.userChooseTag))
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
        guard !state.userChooseTag.isEmpty else {return .none}
        return enviroment.effects().effect.makeGitignoreFileAPI(tag: Array(state.userChooseTag))
            .receive(on: enviroment.mainQueue())
            .catchToEffect(MainAction.savegitignoreDataLoaded)
        
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
        
    case .savegitignoreDataLoaded(let result) :
        switch result{
        case .success(let result):
            enviroment.locals().coreData.addList(
                title: state.titleQuery,
                tag: Array(state.userChooseTag),
                gitignoreString: result)
            .sink { completion in
                if case .failure(let error) = completion{
                    print(error)
                }
            } receiveValue: { success in
                if success{
//                    state.addSheetStatus = !state.addSheetStatus
                }
            }.store(in: &bag)
            return .none
        case .failure(let result):
            return.none
        }
    }
}
