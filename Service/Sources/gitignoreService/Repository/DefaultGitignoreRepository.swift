import Combine
import Foundation

import ComposableArchitecture
import RealmSwift

import gitignoreAPI
import gitignoreLocal

final class DefaultGitignoreRepository : GitignoreAPIRepository & GitignoreLocalRepository{
    
    private let gitignoreRemote = GitignoreRemote.shared
    private let gitignoreLocal = GitignoreLocal.shared
    
    //MARK: - API
    func searchGitignoreMenuAPI() -> Effect<String, gitignoreError> {
        gitignoreRemote.searchGitignoreMenuAPI()
    }
    func createGitignoreFileAPI(tag: [String]) -> Effect<String, gitignoreError> {
        gitignoreRemote.createGitignoreFileAPI(tag: tag)
    }
    
    //MARK: - Local
    func fetchGitignoreRealm() -> AnyPublisher<[GitignoreList],Never>{
        gitignoreLocal.fetchGitignoreRealm()
    }
    
    func saveGitignoreRealm(gitignore: GitignoreList) {
        gitignoreLocal.saveGitignoreList(gitignoreList: gitignore)
    }
    
    func deleteGitignoreRealm(id: UUID) {
        gitignoreLocal.deleteGitignoreList(id: id)
    }
}
