import Foundation
import Combine
import ComposableArchitecture

final public class gitignoreRemote {
    static public let shared = gitignoreRemote()
    
    func searchGitignoreMenuAPI() -> Effect<String, gitignoreError>{
        guard let url = URL(string: "https://www.toptal.com/developers/gitignore/api/list") else {
            fatalError("Error on creating url")
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .mapError{_ in gitignoreError.notFoundError}
            .map(\.data)
            .compactMap{ String(data: $0, encoding: .utf8)}
            .eraseToEffect()
    }
    
    func makeGitignoreFileAPI(tag : [String]) -> Effect<String, gitignoreError>{
        guard let url = URL(string: "https://www.toptal.com/developers/gitignore/api/\(tag.joined(separator: ","))") else {
            fatalError("Error on creating url")
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .mapError{_ in gitignoreError.notFoundError}
            .map(\.data)
            .compactMap{ String(data: $0, encoding: .utf8)}
            .eraseToEffect()
    }
}
