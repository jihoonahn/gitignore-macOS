import Swinject
import gitignoreAPI

final public class APIAssembly : Assembly{
    
    public init(){}
    
    public func assemble(container: Container) {
        container.register(SearchGitignoreMenuUseCase.self) { r in
            SearchGitignoreMenuUseCase(
                gitignoreRepository: r.resolve(GitignoreAPIRepository.self)!
            )
        }
        container.register(CreateGitignoreFileUseCase.self) { r in
            CreateGitignoreFileUseCase(
                gitignoreRepository: r.resolve(GitignoreAPIRepository.self)!
            )
        }
    }
}
