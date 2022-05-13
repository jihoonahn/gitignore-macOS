//
//  IssueView.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/11.
//

import SwiftUI
import ComposableArchitecture

struct IssueView: View {
    let store : Store<IssueState,IssueAction>
    
    var body: some View {
        WebView(url: URL(string: "https://github.com/JiHoonAHN/.gitignore-macOS/issues")!)
            .padding(.leading, -10)
    }
}
