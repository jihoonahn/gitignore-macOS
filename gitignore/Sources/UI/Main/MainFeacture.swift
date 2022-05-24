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
    case searchQueryChanged(String)
    case returnKeyTapTagChoose
    case onAppear
    case dataLoaded(Result<String, ApiError>)
}

struct MainEnvironmnet{
    var request: () -> Effect<String, ApiError>
    var mainQueue: () -> AnySchedulerOf<DispatchQueue>
    
    public init(
        request: @escaping() -> Effect<String, ApiError>,
        mainQueue : @escaping() -> AnySchedulerOf<DispatchQueue>
    ){
        self.request = request
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
        state.inquiryListString  = state.gitignoreListString.filter{ $0.hasPrefix(query) || state.searchQuery.isEmpty}
        state.liststatus = state.searchQuery.isEmpty || state.inquiryListString.isEmpty
        if state.searchQuery.isEmpty{state.inquiryListString = .init()}
        
        guard !query.isEmpty else {return .cancel(id: SearchOptionId.self)}
        return .none
    case .onAppear:
        return enviroment.request()
            .receive(on: enviroment.mainQueue())
            .catchToEffect(MainAction.dataLoaded)
    case .dataLoaded(.success(let result)):
        state.gitignoreListString =  result.replacingOccurrences(of: "\n", with: ",").split(separator: ",").map{ (value) -> String in return (String(value))}
        return .none
    case .dataLoaded(.failure(let result)):
        return .none
    case .returnKeyTapTagChoose:
        guard !state.inquiryListString.isEmpty else {return .none}
        state.userChooseTag.insert(state.inquiryListString[0])
        return .none
    }
}
