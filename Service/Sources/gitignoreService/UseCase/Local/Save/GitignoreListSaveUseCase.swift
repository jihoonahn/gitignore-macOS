import RealmSwift
import gitignoreLocal

public struct GitignoreListSaveUseCase {
    public init(gitignoreRepository : GitignoreLocalRepository){
        self.gitignoreRepository = gitignoreRepository
    }
    private let gitignoreRepository : GitignoreLocalRepository

    public func execute(gitignore: GitignoreList) {
        return gitignoreRepository.saveGitignoreRealm(gitignore: gitignore)
    }
}
