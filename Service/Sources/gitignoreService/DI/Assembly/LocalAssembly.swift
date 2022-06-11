import Swinject
import gitignoreLocal

final public class LocalAssembly : Assembly{

    public init(){}

    public func assemble(container: Container) {
        container.register(GitignoreListSaveUseCase.self) { r in
            GitignoreListSaveUseCase(
                gitignoreRepository: r.resolve(GitignoreLocalRepository.self)!
            )
        }
        container.register(GitignoreListDeleteUseCase.self){ r in
            GitignoreListDeleteUseCase(
                gitignoreRepository: r.resolve(GitignoreLocalRepository.self)!
            )
        }
        container.register(GitignoreListFetchUseCase.self) { r in
            GitignoreListFetchUseCase(
                gitignoreRepository: r.resolve(GitignoreLocalRepository.self)!
            )
        }
    }
}
