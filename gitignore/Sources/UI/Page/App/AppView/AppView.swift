//
//  Home.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/11.
//

import SwiftUI
import ComposableArchitecture

//MARK: - Screen

struct AppView: View {
    let store: Store<AppState, AppAction>
    
    public init(store: Store<AppState, AppAction>) {
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
                        action: AppAction.mainAction
                    ))
                    case "List": ListView(store: self.store.scope(
                        state: \.listState,
                        action: AppAction.listAction
                    ))
                    case "Issue": IssueView(store: self.store.scope(
                        state: \.issueState,
                        action: AppAction.issueAction
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
