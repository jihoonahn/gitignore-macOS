import Foundation
import Combine
import ComposableArchitecture

public enum ApiError : Error{
    case notFoundError
}

public protocol Effects{
    func searchGitignoreMenuAPI() -> Effect<String, ApiError>
}

public class EffectsImpl: Effects{
    public init(){}
    public func searchGitignoreMenuAPI() -> Effect<String, ApiError>{
        guard let url = URL(string: "https://www.toptal.com/developers/gitignore/api/list") else {
            fatalError("Error on creating url")
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .mapError{_ in ApiError.notFoundError}
            .map(\.data)
            .compactMap{ String(data: $0, encoding: .utf8)}
            .eraseToEffect()
    }
    
}
