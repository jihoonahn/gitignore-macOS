import SwiftUI
import Swinject
import ComposableArchitecture
import gitignoreService

import MetricKit

@main
struct gitignoreApp: App {
    static let container = Container()

    init(){
        gitignoreApp.container.registerRepositoryDependency()
        gitignoreApp.container.registerDependency()
    }

    var body: some Scene {
        WindowGroup {
            gitignoreApp.container.resolve(RootView.self)
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

