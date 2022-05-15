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
        WithViewStore(self.store){ viewStore in
            WebView(url: viewStore.issuePageURL!)
                .padding(.leading,-10)
        }
    }
}
