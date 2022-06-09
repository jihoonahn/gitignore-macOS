import SwiftUI
import Swinject
import ComposableArchitecture
import MetricKit

@main
struct gitignoreApp: App {
    
    static let container = Container()

    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

