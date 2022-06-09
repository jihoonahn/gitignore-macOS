import ComposableArchitecture

public protocol GitignoreAPIRepository{
    func searchGitignoreMenuAPI() -> Effect<String, gitignoreError>
    func createGitignoreFileAPI(tag : [String]) -> Effect<String, gitignoreError>
}
