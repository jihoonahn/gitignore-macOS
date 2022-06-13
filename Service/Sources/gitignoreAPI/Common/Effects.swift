import Foundation
import Combine
import ComposableArchitecture

public enum ApiError : Error{
    case notFoundError
}

public protocol Effects{
    func searchGitignoreMenuAPI() -> Effect<String, ApiError>
    func makeGitignoreFileAPI(tag : [String]) -> Effect<String, ApiError>
}

public final class EffectService : BaseService, Effects{}


public extension EffectService{
    func searchGitignoreMenuAPI() -> Effect<String, ApiError>{
        guard let url = URL(string: "https://www.toptal.com/developers/gitignore/api/list") else {
            fatalError("Error on creating url")
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .mapError{_ in ApiError.notFoundError}
            .map(\.data)
            .compactMap{ String(data: $0, encoding: .utf8)}
            .eraseToEffect()
    }
    func makeGitignoreFileAPI(tag : [String]) -> Effect<String, ApiError>{
        guard let url = URL(string: "https://www.toptal.com/developers/gitignore/api/\(tag.joined(separator: ","))") else {
            fatalError("Error on creating url")
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .mapError{_ in ApiError.notFoundError}
            .map(\.data)
            .compactMap{ String(data: $0, encoding: .utf8)}
            .eraseToEffect()
    }
}
