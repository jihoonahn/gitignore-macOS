import Combine
import Foundation

public protocol GitignoreLocalRepository{
    func fetchGitignoreRealm() -> AnyPublisher<[GitignoreList],Never>
    func saveGitignoreRealm(gitignore : GitignoreList)
    func deleteGitignoreRealm(id : String)
}
