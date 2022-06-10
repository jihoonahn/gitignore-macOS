import gitignoreAPI
import ComposableArchitecture

public struct SearchGitignoreMenuUseCase{
    public init(gitignoreRepository : GitignoreAPIRepository){
        self.gitignoreRepository = gitignoreRepository
    }
    private let gitignoreRepository : GitignoreAPIRepository

    public func execute() -> Effect<String, gitignoreError>{
        gitignoreRepository.searchGitignoreMenuAPI()
    }
}

