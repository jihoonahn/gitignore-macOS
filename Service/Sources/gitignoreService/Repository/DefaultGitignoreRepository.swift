import gitignoreAPI
import gitignoreLocal
import ComposableArchitecture

final class DefaultGitignoreRepository : GitignoreAPIRepository & GitignoreLocalRepository{
    
    
    
    //MARK: - API
    func searchGitignoreMenuAPI() -> Effect<String, gitignoreError> {
        
    }
    
    func makeGitignoreFileAPI(tag: [String]) -> Effect<String, gitignoreError> {
        
    }
    
    
    //MARK: - Local
    func fetchGitignoreRealm() {
        
    }
    
    func saveGitignoreRealm(gitignore: GitignoreList) {
        
    }
    
    func deleteGitignoreRealm(id: String) {
        
    }
    
    
}
