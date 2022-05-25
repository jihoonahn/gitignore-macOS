import ComposableArchitecture
import Effects
import SwiftUI

struct MainState: Equatable{
    var searchQuery = ""
    var liststatus : Bool = true
    var inquiryListString : [String] = .init()
    var gitignoreListString : [String] = .init()
    var userChooseTag : Set<String> = .init()
}

enum MainAction{
    case onAppear
    case searchQueryChanged(String)
    case tapTagChoose(Int)
    case createGitignore
    case tagDelete(Int)
    case dataLoaded(Result<String, ApiError>)
    case gitignoredataLoaded(Result<String, ApiError>)
}

struct MainEnvironmnet{
    var effects : () -> ServiceEffectType
    var mainQueue: () -> AnySchedulerOf<DispatchQueue>
    
    public init(
        effects: @escaping() -> ServiceEffectType,
        mainQueue : @escaping() -> AnySchedulerOf<DispatchQueue>
    ){
        self.effects = effects
        self.mainQueue = mainQueue
    }
}

let mainReducer = Reducer<
    MainState,
    MainAction,
    MainEnvironmnet
>{ state, action , enviroment in
    switch action{
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
            .catchToEffect(MainAction.gitignoredataLoaded)

    case .tapTagChoose(let index):
        guard !state.inquiryListString.isEmpty else {return .none}
        state.userChooseTag.insert(state.inquiryListString[index])
        state.searchQuery = ""
        return .none
        
    case .tagDelete(let index) :
        state.userChooseTag.remove(Array(state.userChooseTag)[index])
        return .none
        
        //MARK: - Data Load
    case .dataLoaded(let result):
        switch result{
        case .success(let result):
            state.gitignoreListString =  result.replacingOccurrences(of: "\n", with: ",").split(separator: ",").map{ (value) -> String in return (String(value))}
            return .none
        case .failure(let result):
            return .none
        }
        
    case .gitignoredataLoaded(let result):
        switch result{
        case .success(let result):
            print(result)
            return .none
        case .failure(let result):
            return.none
        }
    }
}
