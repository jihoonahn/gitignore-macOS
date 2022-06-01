import SwiftUI
import Swinject
import ComposableArchitecture
import MetricKit

@main
struct gitignoreApp: App {
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

