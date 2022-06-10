import gitignoreLocal
import Foundation

public struct GitignoreListDeleteUseCase {
    public init(gitignoreRepository : GitignoreLocalRepository){
        self.gitignoreRepository = gitignoreRepository
    }
    private let gitignoreRepository : GitignoreLocalRepository

    public func execute(id : UUID) {
        return gitignoreRepository.deleteGitignoreRealm(id: id)
    }
}

