import Swinject
import ComposableArchitecture
final class ViewAssembly : Assembly{
    func assemble(container: Container) {
        container.register(RootView.self) { _ in RootView()}
    }
}
