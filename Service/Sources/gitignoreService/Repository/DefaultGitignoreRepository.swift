import gitignoreAPI
import gitignoreLocal
import ComposableArchitecture

final class DefaultGitignoreRepository : GitignoreAPIRepository & GitignoreLocalRepository{
    
    private let gitignoreRemote = GitignoreRemote.shared
//    private let gitignoreLocal = gitignoreLocal.shared
    
    //MARK: - API
    func searchGitignoreMenuAPI() -> Effect<String, gitignoreError> {
        gitignoreRemote.searchGitignoreMenuAPI()
    }
    
    func createGitignoreFileAPI(tag: [String]) -> Effect<String, gitignoreError> {
        gitignoreRemote.createGitignoreFileAPI(tag: tag)
    }
    
    
    //MARK: - Local
    func fetchGitignoreRealm() {
        
    }
    
    func saveGitignoreRealm(gitignore: GitignoreList) {
        
    }
    
    func deleteGitignoreRealm(id: String) {
        
    }
}
