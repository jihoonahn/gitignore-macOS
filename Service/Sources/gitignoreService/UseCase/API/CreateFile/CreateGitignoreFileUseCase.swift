import gitignoreAPI
import ComposableArchitecture

public struct CreateGitignoreFileUseCase{
    public init(gitignoreRepository : GitignoreAPIRepository){
        self.gitignoreRepository = gitignoreRepository
    }
    private let gitignoreRepository : GitignoreAPIRepository

    public func execute(tag: [String]) -> Effect<String, gitignoreError>{
        gitignoreRepository.createGitignoreFileAPI(tag: tag)
    }
}
