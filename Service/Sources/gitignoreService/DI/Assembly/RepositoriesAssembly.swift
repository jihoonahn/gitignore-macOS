import Swinject
import gitignoreAPI
import gitignoreLocal

final public class RepositoriesAssembly : Assembly{

    public init(){}
    
    public func assemble(container: Container) {
        container.register(GitignoreAPIRepository.self) { _ in DefaultGitignoreRepository()}
        container.register(GitignoreLocalRepository.self) { _ in DefaultGitignoreRepository()}
    }
}
