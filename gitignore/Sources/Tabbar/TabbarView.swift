//
//  Home.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/11.
//

import SwiftUI
import ComposableArchitecture
import gitignoreView

//MARK: - Screen

struct TabbarView: View {
    let store: Store<TabBarState, TabBarAction>
    
    public init(store: Store<TabBarState, TabBarAction>) {
      self.store = store
    }
    
    @StateObject var homeData = TabBarViewModel()
    var body: some View {
            HStack{
                VStack{
                    TabButton(image: "house.fill", title: "Home", selectedTab: $homeData.selectedTab)
                    TabButton(image: "note.text", title: "List", selectedTab: $homeData.selectedTab)
                    Spacer()
                    TabButton(image: "exclamationmark.circle.fill", title: "Issue", selectedTab: $homeData.selectedTab)
                }
                .padding()
                .padding(.top,35)
                .background(BlurView())
                ZStack{
                    switch homeData.selectedTab{
                    case "Home": MainView(store: self.store.scope(
                        state: \.mainState,
                        action: TabBarAction.mainAction
                    ))
                    case "List": ListView(store: self.store.scope(
                        state: \.listState,
                        action: TabBarAction.listAction
                    ))
                    case "Issue": IssueView(store: self.store.scope(
                        state: \.issueState,
                        action: TabBarAction.issueAction
                    ))
                    default: Text("")
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .ignoresSafeArea(.all, edges: .all)
            .frame( minWidth: 600,minHeight: 400)
            .environmentObject(homeData)
    }
}
