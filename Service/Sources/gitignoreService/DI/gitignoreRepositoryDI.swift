import Swinject
import gitignoreAPI
import gitignoreLocal

public extension Container{
    func registerRepositoryDependency(){
        registerRepositories()
        registerAPIUseCase()
        registerLocalUseCase()
    }
    
    private func registerRepositories() {
        self.register(GitignoreAPIRepository.self) { _ in DefaultGitignoreRepository()}
        self.register(GitignoreLocalRepository.self) { _ in DefaultGitignoreRepository()}
    }
    
    private func registerAPIUseCase(){
        //MARK: - Search
        self.register(SearchGitignoreMenuUseCase.self) { r in
            SearchGitignoreMenuUseCase(
                gitignoreRepository: r.resolve(GitignoreAPIRepository.self)!
            )
        }
        self.register(CreateGitignoreFileUseCase.self) { r in
            CreateGitignoreFileUseCase(
                gitignoreRepository: r.resolve(GitignoreAPIRepository.self)!
            )
        }
    }
    private func registerLocalUseCase(){
        self.register(GitignoreListSaveUseCase.self) { r in
            GitignoreListSaveUseCase(
                gitignoreRepository: r.resolve(GitignoreLocalRepository.self)!
            )
        }
        self.register(GitignoreListDeleteUseCase.self){ r in
            GitignoreListDeleteUseCase(
                gitignoreRepository: r.resolve(GitignoreLocalRepository.self)!
            )
        }
        self.register(GitignoreListFetchUseCase.self) { r in
            GitignoreListFetchUseCase(
                gitignoreRepository: r.resolve(GitignoreLocalRepository.self)!
            )
        }
    }
}
