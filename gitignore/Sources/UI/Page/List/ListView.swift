//
//  ListView.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/11.
//

import SwiftUI
import ComposableArchitecture
import UIUtil
import WaterfallGrid

struct ListView: View {
    let store : Store<ListState,ListAction>
    
    let dummyData : [ListModelex] = [
        ListModelex(title: "first Collection", tag: ["cocoapods","swift","library", "macos"]),
        ListModelex(title: "second Collection", tag: ["spm","swift"]),
        ListModelex(title: "third Collection", tag: ["spm","swift"]),
        ListModelex(title: "fourth Collection", tag: ["spm","swift"]),
        ListModelex(title: "fifth Collection", tag: ["spm","swift"]),
        ListModelex(title: "sixth Collection", tag: ["spm","swift"])
    ]
    
    
    var body: some View {
        Color.backgroundColor
        .ignoresSafeArea()
        .padding(.leading,-10)
        
        WithViewStore(self.store) { viewStore in
            ListCardGrid(models: dummyData)
        }
    }
}

struct Card {
    let title: String
    let subtitle: String
    let tag : [String]
}
