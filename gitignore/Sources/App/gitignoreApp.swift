//
//  gitignoreApp.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/11.
//

import SwiftUI
import ComposableArchitecture

@main
struct gitignoreApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(store: Store(
                initialState: RootState(),
                reducer: rootReducer,
                environment: RootEnvironment()
            ))
        }.windowStyle(HiddenTitleBarWindowStyle())
    }
}
