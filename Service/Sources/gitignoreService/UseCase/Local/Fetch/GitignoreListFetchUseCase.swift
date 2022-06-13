import RealmSwift
import gitignoreLocal
import Combine

public struct GitignoreListFetchUseCase {
    public init(gitignoreRepository : GitignoreLocalRepository){
        self.gitignoreRepository = gitignoreRepository
    }
    private let gitignoreRepository : GitignoreLocalRepository

    public func execute() -> AnyPublisher<[GitignoreList], Never>{
        return gitignoreRepository.fetchGitignoreRealm()
    }
}

