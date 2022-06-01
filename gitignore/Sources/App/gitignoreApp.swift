import SwiftUI
import Swinject
import ComposableArchitecture

@main
struct gitignoreApp: App {
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

