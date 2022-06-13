import gitignoreLocal
import RealmSwift
import Foundation

public struct GitignoreListDeleteUseCase {
    public init(gitignoreRepository : GitignoreLocalRepository){
        self.gitignoreRepository = gitignoreRepository
    }
    private let gitignoreRepository : GitignoreLocalRepository

    public func execute(id : ObjectId) {
        return gitignoreRepository.deleteGitignoreRealm(id: id)
    }
}

