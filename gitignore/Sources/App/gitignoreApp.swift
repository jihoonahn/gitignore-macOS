import SwiftUI
import Swinject
import ComposableArchitecture
import gitignoreService

import MetricKit

@main
struct gitignoreApp: App {
    static let container = Container()
    var assembler : Assembler!
    init(){
        assembler = Assembler([
            APIAssembly(),
            LocalAssembly(),
            RepositoriesAssembly(),
            ViewAssembly()
        ],container: gitignoreApp.container)
    }
    var body: some Scene {
        WindowGroup {
            gitignoreApp.container.resolve(RootView.self)
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

