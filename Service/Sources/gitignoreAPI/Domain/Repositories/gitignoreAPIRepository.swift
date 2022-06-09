import ComposableArchitecture

public protocol GitignoreAPIRepository{
    func searchGitignoreMenuAPI() -> Effect<String, gitignoreError>
    func makeGitignoreFileAPI(tag : [String]) -> Effect<String, gitignoreError>
}
