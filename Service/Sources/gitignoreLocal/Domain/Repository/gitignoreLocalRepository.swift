import Combine

public protocol GitignoreLocalRepository{
    func fetchGitignoreRealm()
    func saveGitignoreRealm(gitignore : GitignoreList)
    func deleteGitignoreRealm(id : String)
}
