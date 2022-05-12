//
//  ListView.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/11.
//

import SwiftUI
import ComposableArchitecture

struct ListView: View {
    let store : Store<ListState,ListAction>

    var body: some View {
        Text("List")
    }
}
